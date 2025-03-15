// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Execute In Place File System (ASXipFS)
 * 
 * Copyright (C) 2018 Microsoft
 * 
 * ASXipFS is designed for read only file systems that use
 * execute in place (XIP) techniques to limit RAM usage on
 * compatible MTD devices.
 * 
 * The file system supports some basic extended attributes
 * and security settings but does not have generic xattr support.
 * Changes were also made to support CoW scenarios, specifically to
 * enable GDB software breakpoints to work with XIP running apps.
 * 
 * This code is based off of CramFS and related XIP patches.
 * A new file system type is forked since CramFS is deprecated and
 * the XIP patches aren't in the mainline.  This work is extended from
 * the following patches and contributions:
 *
 * Compressed rom filesystem for Linux.
 *
 * Copyright (C) 1999 Linus Torvalds.
 *
 * This file is released under the GPL.
 *
 * Linear Addressing code
 *
 * Copyright (C) 2000 Shane Nay.
 *
 * Allows you to have a linearly addressed cramfs filesystem.
 * Saves the need for buffer, and the munging of the buffer.
 * Savings a bit over 32k with default PAGE_SIZE, BUFFER_SIZE
 * etc.  Usefull on embedded platform with ROM :-).
 *
 * Downsides- Currently linear addressed cramfs partitions
 * don't co-exist with block cramfs partitions.
 *
 * 28-Dec-2000: XIP mode for linear cramfs
 * Copyright (C) 2000 Robert Leslie <rob@mars.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
 */

#include <linux/module.h>
#include <linux/fs.h>
#include <linux/pagemap.h>
#include <linux/init.h>
#include <linux/string.h>
#include <linux/blkdev.h>
#include <linux/nsproxy.h>
#include <linux/slab.h>
#include <linux/fs.h>
#include <linux/vfs.h>
#include <linux/mutex.h>
#include <linux/pfn_t.h>
#include <linux/mnt_namespace.h>
#include <linux/uaccess.h>
#include <asm/tlbflush.h>
#include <asm/io.h>
#include <linux/xattr.h>
#include <linux/parser.h>
#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/super.h>
#include <linux/mtd/partitions.h>
#include <linux/fs_context.h>
#include <linux/fs_parser.h>

#include "asxipfs.h"

/*
 * asxipfs super-block data in memory
 */
struct asxipfs_sb_info {
	char dev[32];
	unsigned long magic;
	unsigned long blocks;
	unsigned long files;
	unsigned long flags;
	unsigned int set_owner;
	unsigned int owner;
	unsigned int set_group;
	unsigned int group;
	unsigned int mode;

	bool set_mode;
	bool set_suid_bit;
	bool set_sgid_bit;
	bool no_security_options;
	bool no_symlinks;
};

static inline struct asxipfs_sb_info *ASXIPFS_SB(struct super_block *sb)
{
	return sb->s_fs_info;
}

// Returns true if this instance of the filesystem supports XIP,
// false otherwise.
static bool supports_xip(struct super_block *sb) {
	if (sb->s_mtd && sb->s_mtd->parent && sb->s_mtd->parent->_point != NULL) {
		return true;
	}
	return false;
}

// Returns true if an MTD device is present.
// Usually, call supports_xip instead.
static bool supports_mtd(struct super_block *sb) {
	return sb->s_mtd != NULL;
}

static const struct super_operations asxipfs_ops;
static const struct inode_operations asxipfs_dir_inode_operations;
static const struct file_operations asxipfs_directory_operations;
static const struct address_space_operations asxipfs_aops;

static DEFINE_MUTEX(read_mutex);


/* These macros may change in future, to provide better st_ino semantics. */
#define OFFSET(x)	((x)->i_ino)

/*
 * We have our own block cache: don't fill up the buffer cache
 * with the rom-image, because the way the filesystem is set
 * up the accesses should be fairly regular and cached in the
 * page cache and dentry tree anyway..
 *
 * This also acts as a way to guarantee contiguous areas of up to
 * BLKS_PER_BUF*PAGE_SIZE, so that the caller doesn't need to
 * worry about end-of-buffer issues even when decompressing a full
 * page cache.
 */
#define READ_BUFFERS (2)
/* NEXT_BUFFER(): Loop over [0..(READ_BUFFERS-1)]. */
#define NEXT_BUFFER(_ix) ((_ix) ^ 1)

/*
 * BLKS_PER_BUF_SHIFT should be at least 1 to allow for data
 * data with unlucky alignment.  ASXIPFS does not support
 * compression, or this value may need to be larger yet
 * for cases when compression is poor.
 */
#define BLKS_PER_BUF_SHIFT	(1)
#define BLKS_PER_BUF		(1 << BLKS_PER_BUF_SHIFT)
#define BUFFER_SIZE		(BLKS_PER_BUF*PAGE_SIZE)

// Reference count for read_buffers users
static unsigned int num_read_buffer_users = 0;

// Stores temporary copy of data read from disk, and
// buffers it for possible future re-use.
// Inherited from CramFS
static unsigned char *read_buffers[READ_BUFFERS];

// The block stored in read_buffers
static unsigned buffer_blocknr[READ_BUFFERS];

// The instance of the relevant filesystem
static struct super_block *buffer_dev[READ_BUFFERS];
static int next_buffer;

#define ASXIPFS_INODE_IS_XIP(x)	((x)->i_mode & S_ISVTX)

static unsigned long asxipfsino(const struct asxipfs_inode *cino, unsigned int offset)
{
	if (!cino->offset)
		return offset + 1;
	if (!cino->size)
		return offset + 1;

	return cino->offset << 2;
}

static void *asxipfs_read_xip(struct super_block *sb, unsigned int offset, unsigned int len)
{
	void *retval;
	int ret;
	size_t retlen;

	// mtd_point includes a bound check, so just pass the request through
	ret = mtd_point(sb->s_mtd, offset, len, &retlen, &retval, NULL);
	if (ret) {
		return NULL;
	}

	return retval;
}

static vm_fault_t asxipfs_fault(struct vm_fault *vmf)
{
	struct vm_area_struct *vma = vmf->vma;
	struct file *file = vma->vm_file;
	struct address_space *mapping = file->f_mapping;
	struct inode *inode = mapping->host;
	struct super_block *sb = inode->i_sb;
	struct page *page;
	unsigned long vaddr = (unsigned long)vmf->address;
	unsigned long address = 0;
	pgoff_t size;
	int error = 0;
	unsigned long pfn;
	vm_fault_t vmfault;
	resource_size_t azsphere_physaddr;
	size_t azsphere_readlen;
	void *azsphere_virtaddr;

	// See if it's too big
	size = (i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT;

	if (vmf->pgoff >= size) {
		return VM_FAULT_SIGBUS;
	}

repeat:
	page = find_get_page(mapping, vmf->pgoff);
	if (page) {
		if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags)) {
			put_page(page);
			return VM_FAULT_RETRY;
		}

		if (unlikely(page->mapping != mapping)) {
			unlock_page(page);
			put_page(page);
			goto repeat;
		}
	}

	// Normally, use asxipfs_read_xip, but here the physical address is used below.
	error = mtd_point(
		sb->s_mtd,
		PAGE_ALIGN(OFFSET(inode)),
		PAGE_SIZE,
		&azsphere_readlen,
		&azsphere_virtaddr,
		&azsphere_physaddr);
	if (error) {
		pr_err("mtd_point unexpectedly failed: %d\n", error);
		return VM_FAULT_NOPAGE;
	}

	address = azsphere_physaddr;
	address += vmf->pgoff << PAGE_SHIFT;
	pfn = __phys_to_pfn(address);

	if (vmf->cow_page) {
		// Copy on write - move data from XIP to new page
		struct page *new_page = vmf->cow_page;
		u32 blkptr_offset = PAGE_ALIGN(OFFSET(inode)) +
				(vmf->pgoff << PAGE_SHIFT);

		void *data = asxipfs_read_xip(sb, blkptr_offset, PAGE_SIZE);
		void *vto;
		vm_fault_t ret = 0;

		// Copy data to new page
		vto = kmap_atomic(new_page);
		memcpy(vto, data, PAGE_SIZE);
		kunmap_atomic(vto);

		vmf->page = page;
		__SetPageUptodate(vmf->cow_page);
		ret = finish_fault(vmf);
		if (!ret) {
			ret = VM_FAULT_DONE_COW;
		}
		if(page) {
			unlock_page(page);
			put_page(page);
		}
		return ret;
	}

	if (page) {
		// Clean up old page if needed
		unmap_mapping_range(mapping, vmf->pgoff << PAGE_SHIFT,
							PAGE_SIZE, 0);
		delete_from_page_cache(page);
		unlock_page(page);
		put_page(page);
	}

	// Install page mapped directly to physical memory
	i_mmap_lock_read(mapping);
	vmfault = vmf_insert_mixed(vma, vaddr, pfn_to_pfn_t(pfn));
	if (vmfault & VM_FAULT_ERROR) {
		error = vm_fault_to_errno(vmfault, 0);
	}
	i_mmap_unlock_read(mapping);

	if (error == -ENOMEM) {
		return VM_FAULT_OOM;
	}
	/* -EBUSY is fine, somebody else faulted on the same PTE */
	if ((error < 0) && (error != -EBUSY)) {
		return VM_FAULT_SIGBUS;
	}

	return VM_FAULT_NOPAGE;
}

int asxipfs_access(struct vm_area_struct *vma, unsigned long addr,
			      void *buf, int len, int write)
{
	struct inode *inode;
	u32 blkptr_offset;
	void *data;
	struct super_block *sb;
	struct asxipfs_sb_info *sbi;
	int offset = addr - vma->vm_start;

	// We only work on file mappings
	if (vma->vm_file == NULL)
		return -EINVAL;

	// You can't read beyond the mapping
	if (addr + len > vma->vm_end)
		return -EINVAL;

	inode = vma->vm_file->f_inode;
	sb = inode->i_sb;
	sbi = ASXIPFS_SB(sb);

	// We compute the location in the file by computing the inode offset +
	// the offset in pages of the vma instance.  This tells us where the page starts
	// in mapped space
	blkptr_offset = PAGE_ALIGN(OFFSET(inode)) + (vma->vm_pgoff << PAGE_SHIFT);
	data = asxipfs_read_xip(sb, blkptr_offset, PAGE_SIZE);

	if (write) {
		// Write is not supported (a CoW will happen)
		return -EINVAL;
	}

	if (((vma->vm_pgoff << PAGE_SHIFT) + offset + len) > PAGE_ALIGN(inode->i_size)) {
		// Over sized mapping, read back zeroes
		memset(buf, 0, len);
	} else {
		memcpy_fromio(buf, data + offset, len);
	}

	return len;
}

static const struct vm_operations_struct asxipfs_vm_ops = {
	.access		= asxipfs_access,
	.fault		= asxipfs_fault
};

static int asxipfs_mmap(struct file *file, struct vm_area_struct *vma)
{
	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE)) {
		return -EINVAL;
	}

	/*
	 * VM_MIXEDMAP, as the pages aren't backed by a 'struct page'.
	 */
	vma->vm_ops = &asxipfs_vm_ops;
	vma->vm_flags |= VM_MIXEDMAP;

#ifdef DEBUG_asxipfs_XIP
	{
		unsigned long address, length;
		struct inode *inode = file->f_inode;
		struct super_block *sb = inode->i_sb;
		struct asxipfs_sb_info *sbi = ASXIPFS_SB(sb);

		address  = PAGE_ALIGN(sbi->linear_phys_addr + OFFSET(inode));
		address += vma->vm_pgoff << PAGE_SHIFT;

		length = vma->vm_end - vma->vm_start;
		length = PAGE_ALIGN(length);

		pr_debug("asxipfs_mmap: mapped %s at 0x%08lx, flags 0x%08lx, length %lu to vma 0x%08lx"
			", page_prot 0x%08x\n",
			file->f_path.dentry->d_name.name, address, vma->vm_flags, length,
			vma->vm_start, (unsigned int)pgprot_val(vma->vm_page_prot));
	}
#endif

	return 0;
}

static struct file_operations asxipfs_linear_xip_fops = {
	.llseek		= generic_file_llseek,
	.read_iter		= generic_file_read_iter,
	.mmap		= asxipfs_mmap,
	.splice_read =	generic_file_splice_read,
};

static void *asxipfs_read_noxip(struct super_block *sb, unsigned int offset, unsigned int len)
{
	struct address_space *mapping = sb->s_bdev->bd_inode->i_mapping;
	struct page *pages[BLKS_PER_BUF];
	unsigned i, blocknr, buffer;
	unsigned long devsize;
	char *data;

	if (!len)
		return NULL;
	blocknr = offset >> PAGE_SHIFT;
	offset &= PAGE_SIZE - 1;

	/* Check if an existing buffer already has the data.. */
	for (i = 0; i < READ_BUFFERS; i++) {
		unsigned int blk_offset;

		if (buffer_dev[i] != sb)
			continue;
		if (blocknr < buffer_blocknr[i])
			continue;
		blk_offset = (blocknr - buffer_blocknr[i]) << PAGE_SHIFT;
		blk_offset += offset;
		if (blk_offset > BUFFER_SIZE ||
			blk_offset + len > BUFFER_SIZE)
			continue;
		return read_buffers[i] + blk_offset;
	}

	devsize = mapping->host->i_size >> PAGE_SHIFT;

	/* Ok, read in BLKS_PER_BUF pages completely first. */
	for (i = 0; i < BLKS_PER_BUF; i++) {
		struct page *page = NULL;

		if (blocknr + i < devsize) {
			page = read_mapping_page(mapping, blocknr + i, NULL);
			/* synchronous error? */
			if (IS_ERR(page)) {
				pr_err("read_mapping_page unexpectedly failed: %u/%u\n", blocknr, i);
				page = NULL;
			} else if (page == NULL) {
				pr_err("read_mapping_page returned null: blocknr: %u, i:%u\n", blocknr, i);
			}
		}
		pages[i] = page;
	}

	for (i = 0; i < BLKS_PER_BUF; i++) {
		struct page *page = pages[i];

		if (page) {
			wait_on_page_locked(page);
			if (!PageUptodate(page)) {
				/* asynchronous error */
				put_page(page);
				pages[i] = NULL;
			}
		}
	}

	buffer = next_buffer;
	next_buffer = NEXT_BUFFER(buffer);
	buffer_blocknr[buffer] = blocknr;
	buffer_dev[buffer] = sb;

	data = read_buffers[buffer];
	for (i = 0; i < BLKS_PER_BUF; i++) {
		struct page *page = pages[i];

		if (page) {
			memcpy(data, kmap(page), PAGE_SIZE);
			kunmap(page);
			put_page(page);
		} else
			memset(data, 0, PAGE_SIZE);
		data += PAGE_SIZE;
	}
	return read_buffers[buffer] + offset;
}

/*
 * Returns a pointer to a buffer containing at least LEN bytes of
 * filesystem starting at byte offset OFFSET into the filesystem.
 */
static void *asxipfs_read(struct super_block *sb, unsigned int offset,
			 unsigned int len)
{
	// The approach used here is analgous to that used in cramfs
	if (supports_xip(sb))
		return asxipfs_read_xip(sb, offset, len);
	else
		return asxipfs_read_noxip(sb, offset, len);
}

static struct inode *get_asxipfs_inode(struct super_block *sb,
	const struct asxipfs_inode *asxipfs_inode, unsigned int offset)
{
	struct inode *inode;
	static struct timespec64 zerotime;
	struct asxipfs_sb_info *sbi;

	inode = iget_locked(sb, asxipfsino(asxipfs_inode, offset));
	if (!inode)
		return ERR_PTR(-ENOMEM);
	if (!(inode->i_state & I_NEW))
		return inode;

	sbi = ASXIPFS_SB(sb);

	/* if the lower 2 bits are zero, the inode contains data */
	if (!(inode->i_ino & 3)) {
		inode->i_size = asxipfs_inode->size;
		inode->i_blocks = (asxipfs_inode->size - 1) / 512 + 1;
	}

	// Note that the mtd_* read/write/point functions all ensure that accesses
	// take place within the bound of the partition; thus, additional bounds
	// checks here are superfluous.

	switch (asxipfs_inode->mode & S_IFMT) {
	case S_IFREG:
		// Note: This behavioral difference between XIP/non-XIP is analgous
		// to that used in cramfs.
		if (supports_xip(sb)) {
			// confirm this is a linear FS and that the XIP bit is set on the file
			if (!(asxipfs_inode->mode & S_ISVTX)) {
				pr_err("asxipfs: Non-linear or non-XIP asxipfs is not allowed.\n");
				return ERR_PTR(-EINVAL);
			}

			inode->i_fop = &asxipfs_linear_xip_fops;
		} else {
			inode->i_fop = &generic_ro_fops;
		}
		inode->i_data.a_ops = &asxipfs_aops;
		break;
	case S_IFDIR:
		inode->i_op = &asxipfs_dir_inode_operations;
		inode->i_fop = &asxipfs_directory_operations;
		break;
	case S_IFLNK:
		// If sym links are not allowed then abort
		if(sbi->no_symlinks) {
			pr_err("asxipfs: symlinks disabled\n");
			return ERR_PTR(-EINVAL);
		}

		// if the XIP bit is set, then we can memory-map its body;
		// otherwise, we capture a direct pointer to backing storage
		if (supports_xip(sb) && (asxipfs_inode->mode & S_ISVTX)) {
			inode->i_op = &page_symlink_inode_operations;
			inode_nohighmem(inode);
			inode->i_data.a_ops = &asxipfs_aops;
		} else {
			unsigned int readlen;
			const char *link;

			// make sure that we can read the full symlink body size plus
			// one extra byte (a 0-terminating byte)
			readlen = inode->i_size + 1;
			if ((inode->i_size == 0) || (readlen < inode->i_size)) {
				pr_err("asxipfs: bad symlink length\n");
				return ERR_PTR(-EINVAL);
			}

			link = (char *)asxipfs_read(sb, OFFSET(inode), readlen);
			if (link == NULL) {
				pr_err("asxipfs: unable to read symlink\n");
				return ERR_PTR(-EINVAL);
			}

			// the kernel effectively requires the underlying symlink body to
			// be null-terminated; make sure there's a 0 byte at the end
			// regardless of whether the symlink body contains any embedded
			// 0 bytes in it.
			if (link[inode->i_size] != 0) {
				pr_err("asxipfs: malformed symlink\n");
				return ERR_PTR(-EINVAL);
			}

			if (supports_xip(sb)) {
				inode->i_link = (char *)link;
				inode->i_private = NULL;
			} else {
				char *link_copy = kmalloc(sizeof(char) * readlen, GFP_KERNEL);
				if (!link_copy)
					return ERR_PTR(-ENOMEM);
				strcpy(link_copy, link);
				inode->i_link = (char *)link_copy;

				// Currently only used on this path.  If we ever need private per-inode
				// data, this should change.
				inode->i_private = link_copy;
			}
			inode->i_op = &simple_symlink_inode_operations;
		}
		break;
	default:
		pr_err("asxipfs: unknown inode type\n");
		return ERR_PTR(-EINVAL);
	}

	inode->i_mode = asxipfs_inode->mode | (sbi->set_suid_bit ? S_ISUID : 0) | (sbi->set_sgid_bit ? S_ISGID : 0);

	if (sbi->no_security_options) {
		// Strip off SGID / SUID
		inode->i_mode = inode->i_mode & ~(S_ISUID | S_ISGID);
	}
	if(sbi->set_mode) {
		/* first reset the file permission bits to zero, then set to requested level */
		inode->i_mode = inode->i_mode & ~(S_IRWXU | S_IRWXG | S_IRWXO);
		inode->i_mode |= sbi->mode;
	}

	i_uid_write(inode, sbi->set_owner ? sbi->owner : asxipfs_inode->uid);
	i_gid_write(inode, sbi->set_group ? sbi->group : asxipfs_inode->gid);

	/* Struct copy intentional */
	inode->i_mtime = inode->i_atime = inode->i_ctime = zerotime;
	/* inode->i_nlink is left 1 - arguably wrong for directories,
	   but it's the best we can do without reading the directory
	   contents.  1 yields the right result in GNU find, even
	   without -noleaf option. */

	unlock_new_inode(inode);

	return inode;
}

// Allocate memory for non-XIP read buffers
// and keep a reference count.
static int setup_read_buffers(struct super_block *sb) {
	size_t i;
	size_t num_failures = 0;
	int ret = 0;

	if (!supports_xip(sb)) {
		mutex_lock(&read_mutex);
		for (i = 0; i < READ_BUFFERS; i++) {
			read_buffers[i] = kmalloc(BUFFER_SIZE, GFP_KERNEL);
			if (read_buffers[i] == NULL) {
				++num_failures;
			}
		}
		num_read_buffer_users++;
		mutex_unlock(&read_mutex);
		ret = num_failures ? -ENOMEM : 0;
	}
	else {
		ret = 0;
	}

	return ret;
}

// Free the buffers if necessary.  Call irrespective
// of setup_read_buffers return value.
static void cleanup_read_buffers(struct super_block *sb) {
	size_t i;
	if (!supports_xip(sb)) {
		mutex_lock(&read_mutex);
		// This path should never happen.
		if (num_read_buffer_users == 0) {
			mutex_unlock(&read_mutex);
			return;
		}

		--num_read_buffer_users;
		if (num_read_buffer_users == 0) {
			for (i = 0; i < READ_BUFFERS; i++) {
				kfree(read_buffers[i]);
				read_buffers[i] = NULL;
			}
		}
		mutex_unlock(&read_mutex);
	}
}

static void asxipfs_kill_sb(struct super_block *sb)
{
	// sbi may be null on this path
	struct asxipfs_sb_info *sbi = ASXIPFS_SB(sb);

	// If sbi is non-null, the read buffers need to be cleaned up.
	if (sbi) {
		cleanup_read_buffers(sb);
	}

	if (supports_mtd(sb)) {
		// When using XIP, there is no block device,
		// use the MTD device instead.
		kill_mtd_super(sb);
	} else if (sb->s_bdev != NULL) {
		kill_block_super(sb);
	} else {
		pr_err("Unexpectedly not cleaning up superblock.");
	}

	kfree(sbi);
	sb->s_fs_info = NULL;
}

static int asxipfs_remount(struct super_block *sb, int *flags, char *data)
{
	sync_filesystem(sb);
	*flags |= SB_RDONLY;
	return 0;
}

static int asxipfs_fill_super(struct super_block *sb, struct fs_context *fc)
{
	int i;
	struct asxipfs_super super;
	unsigned long root_offset;
	struct asxipfs_sb_info *sbi = NULL;
	struct inode *root;
	void *data;
	int err = 0;

	sbi = kmalloc(sizeof(struct asxipfs_sb_info), GFP_KERNEL);
	if (!sbi) {
		err = -ENOMEM;
		goto exit_with_err;
	}

	*sbi = *(struct asxipfs_sb_info *) fc->fs_private;
	sb->s_fs_info = sbi;
	sb->s_flags |= SB_RDONLY;

	// Note: the image should already have been verified at this point.

	// The partition mtd has the same "type" as the master,
	// but some fields in "flags" are masked off relative to master.
	if (supports_xip(sb)) {
		pr_debug("XIP support enabled for %s", sbi->dev);
	} else if (sb->s_bdev != NULL) {
		pr_debug("Block device support enabled for %s", sbi->dev);
	} else {
		// Annoyingly, don't emit anything on this path.
		// When using as a block device, the code tries
		// MTD first, and if it fails, it'll take this path.
		// Otherwise, we see a message at mount time for every
		// app.
		err = -EINVAL;
		goto exit_with_err;
	}

	if (setup_read_buffers(sb)) {
		err = -ENOMEM;
		goto exit_with_err_read_buffers;
	}

	for (i = 0; i < READ_BUFFERS; i++) {
		buffer_blocknr[i] = -1;
	}

	/* Invalidate the read buffers on mount: think disk change.. */
	mutex_lock(&read_mutex);

	/* Read the first block and get the superblock from it */
	data = asxipfs_read(sb, 0, sizeof(super));
	if (!data) {
		mutex_unlock(&read_mutex);
		err = -EINVAL;
		goto exit_with_err_read_buffers;
	}

	/* Check image alignment in XIP case */
	if (supports_xip(sb) && data) {
		if (((uintptr_t) data) % PAGE_SIZE != 0) {
			mutex_unlock(&read_mutex);
			pr_err("asxipfs: XIP is enabled but flash is not aligned to PAGE_SIZE.\n");
			err = -EINVAL;
			goto exit_with_err_read_buffers;
		}
	}

	memcpy(&super, data, sizeof(super));
	mutex_unlock(&read_mutex);

	/* Do sanity checks on the superblock */
	if (super.magic != ASXIPFS_MAGIC) {
		pr_err("asxipfs: wrong magic %x, data:%x\n", super.magic, (unsigned) data);
		err = -EINVAL;
		goto exit_with_err_read_buffers;
	}

	/* get feature flags first */
	if (super.flags & ~ASXIPFS_SUPPORTED_FLAGS) {
		pr_err("asxipfs: unsupported filesystem features\n");
		err = -EINVAL;
		goto exit_with_err_read_buffers;
	}

	/* Check that the root inode is in a sane state */
	if (!S_ISDIR(super.root.mode)) {
		pr_err("asxipfs: root is not a directory\n");
		err = -EINVAL;
		goto exit_with_err_read_buffers;
	}

	super.root.mode |= (S_IRUSR | S_IXUSR | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH);

	root_offset = super.root.offset << 2;
	if (super.flags & ASXIPFS_FLAG_FSID_VERSION_2) {
		sbi->blocks = super.fsid.blocks;
		sbi->files = super.fsid.files;
	} else {
		sbi->blocks = 0;
		sbi->files = 0;
	}
	sbi->magic = super.magic;
	sbi->flags = super.flags;
	if (root_offset == 0)
		pr_info("empty filesystem");
	else if (!(super.flags & ASXIPFS_FLAG_SHIFTED_ROOT_OFFSET) &&
		 ((root_offset != sizeof(struct asxipfs_super)) &&
		  (root_offset != 512 + sizeof(struct asxipfs_super))))
	{
		pr_err("asxipfs: bad root offset %lu\n", root_offset);
		err = -EINVAL;
		goto exit_with_err_read_buffers;
	}

	/* Set it all up.. */
	sb->s_op = &asxipfs_ops;
	root = get_asxipfs_inode(sb, &super.root, 0);
	if (IS_ERR(root)) {
		err = PTR_ERR(root);
		goto exit_with_err_read_buffers;
	}

	sb->s_root = d_make_root(root);
	if (!sb->s_root) {
		err = -ENOMEM;
		goto exit_and_release_with_err;
	}

	return 0;

exit_and_release_with_err:
	iput(root);
exit_with_err_read_buffers:
	cleanup_read_buffers(sb);
exit_with_err:
	kfree(sbi);
	sb->s_fs_info = NULL;
	return err;
}

static void asxipfs_evict_inode(struct inode *inode) {
	if (S_ISLNK(inode->i_mode) && inode->i_private) {
		// Free it if the allocation took place in this driver.
		kfree(inode->i_link);
		inode->i_link = NULL;
		inode->i_private = NULL;
	}

	truncate_inode_pages_final(&inode->i_data);
	clear_inode(inode);
}

static int asxipfs_statfs(struct dentry *dentry, struct kstatfs *buf)
{
	struct super_block *sb = dentry->d_sb;
	struct asxipfs_sb_info *sbi = ASXIPFS_SB(sb);
	u64 id = 0;

	buf->f_type = ASXIPFS_MAGIC;
	buf->f_bsize = PAGE_SIZE;
	buf->f_blocks = sbi->blocks;
	buf->f_bfree = 0;
	buf->f_bavail = 0;
	buf->f_files = sbi->files;
	buf->f_ffree = 0;
	buf->f_fsid.val[0] = (u32)id;
	buf->f_fsid.val[1] = (u32)(id >> 32);
	buf->f_namelen = ASXIPFS_MAXPATHLEN;
	return 0;
}

/*
 * Read a asxipfs directory entry.
 */
static int asxipfs_readdir(struct file *file, struct dir_context *ctx)
{
	struct inode *inode = file_inode(file);
	struct super_block *sb = inode->i_sb;
	char *buf;
	unsigned int offset;

	/* Offset within the thing. */
	if (ctx->pos >= inode->i_size)
		return 0;
	offset = ctx->pos;
	/* Directory entries are always 4-byte aligned */
	if (offset & 3)
		return -EINVAL;

	buf = kmalloc(ASXIPFS_MAXPATHLEN, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;

	while (offset < inode->i_size) {
		struct asxipfs_inode *de;
		unsigned long nextoffset;
		char *name;
		ino_t ino;
		umode_t mode;
		int namelen;

		mutex_lock(&read_mutex);
		de = asxipfs_read(sb, OFFSET(inode) + offset, sizeof(*de)+ASXIPFS_MAXPATHLEN);
		if (!de) {
			mutex_unlock(&read_mutex);
			break;
		}
		name = (char *)(de+1);

		/*
		 * Namelengths on disk are shifted by two
		 * and the name padded out to 4-byte boundaries
		 * with zeroes.
		 */
		namelen = de->namelen << 2;
		memcpy(buf, name, namelen);
		ino = asxipfsino(de, OFFSET(inode) + offset);
		mode = de->mode;
		mutex_unlock(&read_mutex);
		nextoffset = offset + sizeof(*de) + namelen;
		for (;;) {
			if (!namelen) {
				kfree(buf);
				return -EIO;
			}
			if (buf[namelen-1])
				break;
			namelen--;
		}
		if (!dir_emit(ctx, buf, namelen, ino, mode >> 12))
			break;

		ctx->pos = offset = nextoffset;
	}
	kfree(buf);
	return 0;
}

/*
 * Lookup and fill in the inode data..
 */
static struct dentry *asxipfs_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
{
	unsigned int offset = 0;
	struct inode *inode = NULL;
	int sorted;
	struct asxipfs_sb_info *sbi = ASXIPFS_SB(dir->i_sb);

	mutex_lock(&read_mutex);
	sorted = sbi->flags & ASXIPFS_FLAG_SORTED_DIRS;
	while (offset < dir->i_size) {
		struct asxipfs_inode *de;
		char *name;
		int namelen, retval;
		int dir_off = OFFSET(dir) + offset;

		de = asxipfs_read(dir->i_sb, dir_off, sizeof(*de)+ASXIPFS_MAXPATHLEN);
		if (!de) {
			inode = ERR_PTR(-EIO);
			break;
		}
		name = (char *)(de+1);

		/* Try to take advantage of sorted directories */
		if (sorted && (dentry->d_name.name[0] < name[0]))
			break;

		namelen = de->namelen << 2;
		offset += sizeof(*de) + namelen;

		/* Quick check that the name is roughly the right length */
		if (((dentry->d_name.len + 3) & ~3) != namelen)
			continue;

		for (;;) {
			if (!namelen) {
				inode = ERR_PTR(-EIO);
				goto out;
			}
			if (name[namelen-1])
				break;
			namelen--;
		}
		if (namelen != dentry->d_name.len)
			continue;
		retval = memcmp(dentry->d_name.name, name, namelen);
		if (retval > 0)
			continue;
		if (!retval) {
			inode = get_asxipfs_inode(dir->i_sb, de, dir_off);
			break;
		}
		/* else (retval < 0) */
		if (sorted)
			break;
	}
out:
	mutex_unlock(&read_mutex);
	if (IS_ERR(inode))
		return ERR_CAST(inode);
	d_add(dentry, inode);
	return NULL;
}

static int asxipfs_readpage(struct file *file, struct page *page)
{
	struct inode *inode = page->mapping->host;
	u32 maxblock;
	int bytes_filled;
	void *pgdata;
	struct super_block *sb;
	struct asxipfs_sb_info *sbi;

	maxblock = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
	bytes_filled = 0;
	pgdata = kmap(page);

	sb = inode->i_sb;
	sbi = ASXIPFS_SB(sb);

	/* asxipfs doesn't handle compressed files */
	if(!ASXIPFS_INODE_IS_XIP(inode)) {
	 	pr_err("asxipfs: Found compressed block\n");
	 	goto err;
	}

	if (page->index < maxblock) {
		u32 blkptr_offset = OFFSET(inode) + page->index * PAGE_SIZE;
		void *data;

		// XIP requires page-aligned reads.
		// Non-XIP does not have this requirement, which suggests a possible
		// space-saving optimization.
		if (supports_xip(sb)) {
			if (PAGE_ALIGN(OFFSET(inode)) != OFFSET(inode)) {
				pr_err("Misaligned data at %lu\n", OFFSET(inode));
				goto err;
			}
		}

		mutex_lock(&read_mutex);
		data = asxipfs_read(sb, blkptr_offset, PAGE_SIZE);
		if (data != NULL)
			memcpy(page_address(page),
				data,
				PAGE_SIZE);
		mutex_unlock(&read_mutex);
		if (data == NULL)
			goto err;

		// If xip is off, we probably don't want this, but it does
		// not hurt.  It becomes redundant, because the underlying
		// read will already zero this.  In the XIP case, this logic
		// is required.
		bytes_filled = PAGE_SIZE;
	}

	memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
	flush_dcache_page(page);
	kunmap(page);
	SetPageUptodate(page);
	unlock_page(page);
	return 0;

err:
	kunmap(page);
	ClearPageUptodate(page);
	SetPageError(page);
	unlock_page(page);
	return 0;
}

/* This function is necessary for starting IO core apps.  It would be nice
   to remove it, but doing so does not appear to be easy.  */
static sector_t asxipfs_bmap(struct address_space *mapping, sector_t block)
{
	struct inode *inode = mapping->host;
	u32 maxblock;
	struct super_block *sb;
	u32 blkptr_offset;
	struct asxipfs_sb_info *sbi;

	/* asxipfs doesn't handle compressed files */
	if(!ASXIPFS_INODE_IS_XIP(inode)) {
		pr_err("asxipfs: Found compressed block\n");
		return -EINVAL;
	}

	maxblock = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;

	if (block > maxblock) {
		return -EINVAL;
	}

	sb = inode->i_sb;
	sbi = ASXIPFS_SB(sb);
	blkptr_offset = PAGE_ALIGN(OFFSET(inode)) +
			block * PAGE_SIZE;
	return blkptr_offset;
}

static const struct address_space_operations asxipfs_aops = {
	.readpage = asxipfs_readpage,
	.bmap = asxipfs_bmap,
};

/*
 * Our operations:
 */

// Filesystem mount parameters
enum asxipfs_param {
	Opt_source,
	Opt_owner,
	Opt_group,
	Opt_suid,
	Opt_sgid,
	Opt_nosec,
	Opt_mode,
	Opt_no_symlinks
};

static const struct fs_parameter_spec asxipfs_param_specs[] = {
	fsparam_string("source", Opt_source),
	fsparam_u32("owner",	Opt_owner),
	fsparam_u32("group",	Opt_group),
	fsparam_u32("suid",	Opt_suid),
	fsparam_u32("sgid",	Opt_sgid),
	fsparam_flag("nosec",	Opt_nosec),
	fsparam_u32oct("mode",	Opt_mode),
	fsparam_flag("nosym", Opt_no_symlinks),
	{}
};

static int asxipfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
{
	struct fs_parse_result result;
	struct asxipfs_sb_info *sbi = fc->fs_private;
	int opt;

	opt = fs_parse(fc, asxipfs_param_specs, param, &result);
	if (opt < 0) {
		/*
		 * We might like to report bad mount options here;
		 * but traditionally asxipfs has ignored all mount options,
		 * and as it is used as a !CONFIG_SHMEM simple substitute
		 * for tmpfs, better continue to ignore other mount options.
		 */
		pr_err("Failed to parse option: %d key:%s\n", opt, param->key);
		if (opt == -ENOPARAM)
		 	opt = 0;
		return opt;
	}

	switch (opt) {
	case Opt_source:
		strlcpy(sbi->dev, param->string, sizeof(sbi->dev));

		// Taking ownership of the string this way appears to be
		// correct per existing fuse/afs filesystems.
		fc->source = param->string;
		param->string = NULL;
		break;
	case Opt_owner:
		sbi->set_owner = 1;
		sbi->owner = result.uint_32;
		break;
	case Opt_group:
		sbi->set_group = 1;
		sbi->group = result.uint_32;
		break;
	case Opt_suid:
		if (result.uint_32 < 0 || result.uint_32 > 1) {
			pr_err("asxipfs: suid parameter must be 0 or 1\n");
			return 0;
		}
		sbi->set_suid_bit = true;
		break;
	case Opt_sgid:
		if (result.uint_32 < 0 || result.uint_32 > 1) {
			pr_err("asxipfs: sgid parameter must be 0 or 1\n");
			return 0;
		}
		sbi->set_sgid_bit = true;
		break;
	case Opt_nosec:
		sbi->no_security_options = true;
		break;
	case Opt_mode:
		sbi->set_mode = true;
		sbi->mode = result.uint_32;
		break;
	case Opt_no_symlinks:
		sbi->no_symlinks = true;
		break;
	default:
		pr_err("asxipfs: unrecognized mount option \"%s\" or missing value\n", param->key);
		return 0;
	}

	return 0;
}

/*
 * A directory can only readdir
 */
static const struct file_operations asxipfs_directory_operations = {
	.llseek		= generic_file_llseek,
	.read		= generic_read_dir,
	.iterate_shared	= asxipfs_readdir,
};

static const struct inode_operations asxipfs_dir_inode_operations = {
	.lookup		= asxipfs_lookup,
};

static const struct super_operations asxipfs_ops = {
	.remount_fs	= asxipfs_remount,
	.statfs		= asxipfs_statfs,
	.evict_inode =	asxipfs_evict_inode,
	.drop_inode = generic_delete_inode,
};

static int asxipfs_get_tree(struct fs_context *fc)
{
	int ret = -ENOPROTOOPT;

	ret = get_tree_mtd(fc, asxipfs_fill_super);
	if (ret == 0) {
		pr_debug("Successfully mounted mtd %s %d: %s\n", __FUNCTION__, __LINE__, fc->source);
		return ret;
	}

	ret = get_tree_bdev(fc, asxipfs_fill_super);
	if (ret == 0) {
		pr_debug("Successfully mounted block device %s %d: %s\n", __FUNCTION__, __LINE__, fc->source);
	}

	if (ret) {
		pr_err("Failed to mount device %s.\n", fc->source);
	}

	return ret;
}

static void asxipfs_free_fs_context(struct fs_context *fc)
{
	kfree(fc->fs_private);
	fc->fs_private = NULL;
}

static const struct fs_context_operations asxipfs_context_ops = {
	.parse_param = asxipfs_parse_param,
	.get_tree	= asxipfs_get_tree,
	.free		= asxipfs_free_fs_context,
};

/*
 * Set up the filesystem mount context.
 */
static int asxipfs_init_fs_context(struct fs_context *fc)
{
	struct asxipfs_sb_info *sbi = kzalloc(sizeof(struct asxipfs_sb_info), GFP_KERNEL);
	if (!sbi)
		return -ENOMEM;
	fc->fs_private = sbi;
	fc->ops = &asxipfs_context_ops;
	return 0;
}

static struct file_system_type asxipfs_fs_type = {
	.owner		= THIS_MODULE,
	.name		= "asxipfs",
	.parameters	= asxipfs_param_specs,
	.init_fs_context = asxipfs_init_fs_context,
	.kill_sb	= asxipfs_kill_sb,
};

MODULE_ALIAS_FS("asxipfs");

static int __init init_asxipfs_fs(void)
{
	int rv;
	rv = register_filesystem(&asxipfs_fs_type);
	return rv;
}

static void __exit exit_asxipfs_fs(void)
{
	unregister_filesystem(&asxipfs_fs_type);
}

module_init(init_asxipfs_fs)
module_exit(exit_asxipfs_fs)
MODULE_LICENSE("GPL");
