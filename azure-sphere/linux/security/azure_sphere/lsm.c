// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Linux Security Module
 *
 * Copyright (c) 2018 Microsoft Corporation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place - Suite 330, Boston, MA 02111-1307 USA.
 *
 */

#include <linux/device.h>
#include <linux/lsm_hooks.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/mount.h>
#include <linux/kernel.h>
#include <linux/binfmts.h>
#include <linux/types.h>
#include <linux/security.h>
#include <linux/file.h>
#include <linux/dcache.h>
#include <linux/cred.h>
#include <linux/uaccess.h>
#include <linux/mman.h>
#include <linux/socket.h>
#include <net/sock.h>

#include <linux/fs.h>
#include <linux/miscdevice.h>

#include <azure-sphere/security.h>
#include <azure-sphere/coredump.h>
#include "lsm.h"

#include <linux/printk.h>
#include <azure-sphere/pluton.h>
#include <azure-sphere/pluton_remoteapi.h>
#include <linux/ptrace.h>

#define SUCCESS 0
#define SYS_LOG_GROUP 12 // sys-log group
#define NETWORK_READ_PROXY_CONFIG_GROUP 23 // ipc-group-network-readproxyconfig

#ifdef CONFIG_AZURE_SPHERE_ATTR
// Structure to store atomic usage info along with attribute data
struct azure_sphere_task_attr_atomic {
    atomic_t usage;
    struct azure_sphere_task_attr attr;
};

// It is expected any code additions using this function will be behind a #ifdef for
// the CONFIG_AZURE_SPHERE_ATTR flag to avoid impacting systems that don't have the flag
inline struct azure_sphere_task_attr *get_azure_sphere_attr(void) {
    struct azure_sphere_task_attr_atomic *atomic_attr;
    atomic_attr = current->azure_sphere_attr;
    if(atomic_attr) {
        return &atomic_attr->attr;
    }

    return 0;
}

static int azure_sphere_task_alloc(struct task_struct *task, unsigned long clone_flags)
{
    struct azure_sphere_task_attr_atomic *atomic_attr;

    //if cloning a thread then indicate an additional usage of the attributes
    if(task->azure_sphere_attr && (clone_flags & CLONE_THREAD)) {
        atomic_attr = task->azure_sphere_attr;
        atomic_inc(&atomic_attr->usage);
    }
    else {
        task->azure_sphere_attr = 0;    //do not copy the attributes to the new process
    }

    return 0;
}

static void azure_sphere_task_free(struct task_struct *task)
{
    struct azure_sphere_task_attr_atomic *atomic_attr;

    if(task->azure_sphere_attr) {
        //decrement the usage counter
        atomic_attr = task->azure_sphere_attr;
        if(atomic_dec_and_test(&atomic_attr->usage)) {
            task->azure_sphere_attr = 0;
            kfree(atomic_attr);
        }
    }
}
#endif //CONFIG_AZURE_SPHERE_ATTR

static int azure_sphere_task_setpgid(struct task_struct *p, pid_t pgid)
{
    struct azure_sphere_task_cred *tsec = p->cred->security;

    if (!tsec->is_app_man && !tsec->job_control_allowed) {
        return -ENOSYS;
    }

    return 0;
}

static int azure_sphere_cred_alloc_blank(struct cred *cred, gfp_t gfp)
{
	struct azure_sphere_task_cred *tsec;

	tsec = kzalloc(sizeof(struct azure_sphere_task_cred), gfp);
	if (!tsec)
		return -ENOMEM;

	cred->security = tsec;
	return 0;
}

static void azure_sphere_cred_free(struct cred *cred)
{
	struct azure_sphere_task_cred *tsec = cred->security;
	cred->security = 0;
	kfree(tsec);
}

static int azure_sphere_cred_prepare(struct cred *new, const struct cred *old, gfp_t gfp)
{
	const struct azure_sphere_task_cred *old_tsec;
	struct azure_sphere_task_cred *tsec;

	old_tsec = old->security;

	tsec = kmemdup(old_tsec, sizeof(struct azure_sphere_task_cred), gfp);
	if (!tsec)
		return -ENOMEM;

	new->security = tsec;
	return 0;
}

static void azure_sphere_cred_transfer(struct cred *new, const struct cred *old)
{
	const struct azure_sphere_task_cred *old_tsec = old->security;
	struct azure_sphere_task_cred *tsec = new->security;

	*tsec = *old_tsec;
}

static void azure_sphere_cred_init_security(void)
{
	struct cred *cred = (struct cred *) current->real_cred;
	struct azure_sphere_task_cred *tsec;

	tsec = kzalloc(sizeof(struct azure_sphere_task_cred), GFP_KERNEL);
	if (!tsec)
		panic("Failed to initialize initial task security object.\n");

	tsec->is_app_man = true;
    tsec->capabilities = AZURE_SPHERE_CAP_ALL;
    cred->security = tsec;
}

bool azure_sphere_capable(azure_sphere_capability_t cap)
{
    const struct cred *cred;
    const struct azure_sphere_task_cred *tsec;
    bool ret = false;

    cred = get_task_cred(current);
    tsec = cred->security;
    if (!cred->security) {
        put_cred(cred);
        return false;
    }

    ret = ((tsec->capabilities & cap) == cap);

    put_cred(cred);
    return ret;
}

bool azure_sphere_get_component_id(struct azure_sphere_guid *component_id, struct task_struct *p)
{
    const struct cred *cred;
    const struct azure_sphere_task_cred *tsec;

    if (!component_id)
        return false;
    
    cred = get_task_cred(p);
    tsec = cred->security;
    if (!cred->security) {
        put_cred(cred);
        return false;
    }

    *component_id = tsec->component_id.guid;

    put_cred(cred);

    return true;
}

static int azure_sphere_security_getprocattr(struct task_struct *p, char *name, char **value)
{
    const struct cred *cred;
    const struct azure_sphere_task_cred *tsec;
    int ret = 0;

    cred = get_task_cred(p);
    tsec = cred->security;

    //if no security entry then fail
    if (!tsec) {
        put_cred(cred);
        return -ENOENT;
    }

    if (strcmp(name, "exec") == 0) {
        *value = kmalloc(sizeof(*tsec), GFP_KERNEL);
        if (*value == NULL) {
            ret = -ENOMEM;
        } else {
            memcpy(*value, tsec, sizeof(*tsec));
            ret = sizeof(*tsec);
        }
    } else if (strcmp(name, "current") == 0) {
        int tenant_id_strlen = strnlen(tsec->daa_tenant_id, sizeof(tsec->daa_tenant_id));
        int len = 5 + 36 + 1 + 5 + tenant_id_strlen + 1 + 15 + 1; // "CID: " + <guid> + "\n" + "TID: " + <tenant id> + "\n" + "CAPS: 00000000\n" + NULL
        *value = kmalloc(len, GFP_KERNEL);
        if (*value == NULL) {
            ret = -ENOMEM;
        } else {
            ret = snprintf(*value, len, "CID: %08X-%04hX-%04hX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX\nTID: %.*s\nCAPS: %08X\n",
                tsec->component_id.guid.data1, tsec->component_id.guid.data2, tsec->component_id.guid.data3,
                tsec->component_id.guid.data4[0], tsec->component_id.guid.data4[1], tsec->component_id.guid.data4[2], tsec->component_id.guid.data4[3],
                tsec->component_id.guid.data4[4], tsec->component_id.guid.data4[5], tsec->component_id.guid.data4[6], tsec->component_id.guid.data4[7],
                tenant_id_strlen, tsec->daa_tenant_id, tsec->capabilities);
        }
    } else {
        ret = -ENOTSUPP;
    }

    put_cred(cred);
    return ret;
}

#ifdef CONFIG_AZURE_SPHERE_ATTR
static bool is_attr_data_valid(struct azure_sphere_task_attr *attr)
{
 // This function is responsible for validating that the information in attr is valid

    return true;
}
#endif //CONFIG_AZURE_SPHERE_ATTR

static int azure_sphere_security_setprocattr(const char *name, void *value, size_t size) {
    struct azure_sphere_security_set_process_details *exec_data;
    struct cred *cred;
    struct azure_sphere_task_cred *tsec;
#ifdef CONFIG_AZURE_SPHERE_ATTR
    const struct cred *current_cred;
    const struct azure_sphere_task_cred *current_tsec;
    struct azure_sphere_task_attr_atomic *attr_data;
#endif //CONFIG_AZURE_SPHERE_ATTR
    int ret;

    // Can only set security data in exec
    if (strcmp(name, "exec") == 0) {
        if (value == NULL || size < sizeof(*exec_data)) {
            return -EINVAL;
        }

        exec_data = value;

        cred = prepare_creds();
        if (!cred) {
            return -ENOMEM;
        }
        tsec = cred->security;

        //if no security entry then fail
        if (!tsec) {
            ret = -ENOENT;
            goto error;
        }

        if (!tsec->is_app_man) {
            ret = -EPERM;
            goto error;
        }


        memcpy(&tsec->component_id, exec_data->component_id, sizeof(tsec->component_id));
        memset(&tsec->daa_tenant_id, 0, sizeof(tsec->daa_tenant_id));
        memcpy(&tsec->daa_tenant_id, exec_data->daa_tenant_id, strnlen(exec_data->daa_tenant_id, sizeof(tsec->daa_tenant_id) - 1));
        tsec->is_app_man = false;
        tsec->job_control_allowed = exec_data->job_control_allowed;
        tsec->capabilities = exec_data->capabilities;

        return commit_creds(cred);
    }
#ifdef CONFIG_AZURE_SPHERE_ATTR
    else if(strcmp(name, "azure_sphere") == 0) {
        // setting attributes, make sure the size is valid
        if (value == NULL || size < sizeof(struct azure_sphere_task_attr)) {
            return -EINVAL;
        }

        // we do not currently allow extending or modifying the value once set
        if(current->azure_sphere_attr) {
            return -EINVAL;
        }

        current_cred = get_task_cred(current);
        current_tsec = current_cred->security;

        // if no security entry or no longer appman then fail
        if (!current_tsec || !current_tsec->is_app_man) {
            put_cred(current_cred);
            return -ENOENT;
        }

        put_cred(current_cred);

        // validate the new structure
        if(!is_attr_data_valid(value)) {
            return -EINVAL;
        }

        // allocate memory for the new structure and configure it
        attr_data = kmalloc(sizeof(*attr_data), GFP_KERNEL);
        memcpy(&attr_data->attr, value, sizeof(struct azure_sphere_task_attr));
        atomic_set(&attr_data->usage, 1);

        // assign to the task
        current->azure_sphere_attr = attr_data;
        return 0;
    }
#endif //CONFIG_AZURE_SPHERE_ATTR

    //not exec or azure_sphere, fail
    return -EINVAL;

error:
    abort_creds(cred);
    return ret;
}

#ifdef CONFIG_AZURE_SPHERE_MMAP_EXEC_PROTECTION
int azure_sphere_mmap_file(struct file *file, unsigned long reqprot, unsigned long prot, unsigned long flags) {
    // if attempting write and execute at the same time then deny
    if((reqprot & (PROT_WRITE | PROT_EXEC)) == (PROT_WRITE | PROT_EXEC))
        return -EPERM;

    //if requesting exec on shared memory then fail
    if((reqprot & PROT_EXEC) && (flags & MAP_SHARED))
        return -EPERM;

    //if requesting exec on a non-regular file then fail
    if((reqprot & PROT_EXEC) && file && (!file->f_path.dentry->d_inode || !S_ISREG(file->f_path.dentry->d_inode->i_mode)))
        return -EPERM;

    //all good
    return 0;
}

int azure_sphere_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot, unsigned long prot) {
    // if attempting write and execute at the same time then deny
    if((reqprot & (PROT_WRITE | PROT_EXEC)) == (PROT_WRITE | PROT_EXEC))
        return -EPERM;

    // check the current VMA flags, if swapping between write and execute then fail
    if((vma->vm_flags & VM_WRITE) && (reqprot & PROT_EXEC)) {
        return -EPERM;
    }
    else if((vma->vm_flags & VM_EXEC) && (reqprot & PROT_WRITE)) {
        return -EPERM;
    }
    else if((vma->vm_flags & VM_SHARED) && (reqprot & PROT_EXEC)) {
        return -EPERM;
    }

    //if requesting exec on a non-regular file then fail
    if((reqprot & PROT_EXEC) && vma->vm_file && (!vma->vm_file->f_path.dentry->d_inode || !S_ISREG(vma->vm_file->f_path.dentry->d_inode->i_mode)))
        return -EPERM;

    return 0;
}
#endif

int azure_sphere_socket_bind(struct socket *sock, struct sockaddr *address, int addrlen) {
    struct sockaddr_in *addr = (struct sockaddr_in *)address;

    // if AF_INET then see if this is for port 5353
    // if so then restrict to CAP_NET_ADMIN which only NetworkD can use
    if(sock->ops->family == AF_INET) {
        if(addr->sin_port == htons(5353)) {
            if(!ns_capable(sock_net(sock->sk)->user_ns, CAP_NET_ADMIN))
                return -EPERM;
        }
    }

    return 0;
}

#ifdef CONFIG_COREDUMP

//copied from the GUID in azcore's manifest
static const guid_t azcore_comp_id = GUID_INIT(0xa65f3686, 0xe50a, 0x4fff, 0xb2, 0x5d, 0x41, 0x5c, 0x20, 0x65, 0x37, 0xaf);

static void bprm_committing_creds_hook(struct linux_binprm *bprm)
{
    gid_t gid;
    struct azure_sphere_security_set_process_details azcore_sec_data;

    struct group_info *groups;

    if (!strcmp(bprm->filename, AZCORE_PATH)) {
        gid = bprm->file->f_inode->i_gid.val;

        bprm->cred->uid.val = gid;
        bprm->cred->euid.val = gid;
        bprm->cred->suid.val = gid;
        bprm->cred->fsuid.val = gid;

        bprm->cred->gid.val = gid;
        bprm->cred->egid.val = gid;
        bprm->cred->sgid.val = gid;
        bprm->cred->fsgid.val = gid;

        /*
         * Supplementary groups for azcore. These must match:
         * exp23-yocto:meta-azure-sphere-core/recipes-core/base-passwd/base-passwd/group.azuresphere.master
         */
        groups = groups_alloc(2);
        groups->gid[0].val = SYS_LOG_GROUP;
        groups->gid[1].val = NETWORK_READ_PROXY_CONFIG_GROUP;
        bprm->cred->group_info = groups;

        cap_clear(bprm->cred->cap_inheritable);
        cap_clear(bprm->cred->cap_permitted);
        cap_clear(bprm->cred->cap_effective);
        cap_clear(bprm->cred->cap_bset);
        cap_clear(bprm->cred->cap_ambient);
        cap_raise(bprm->cred->cap_effective, CAP_SYSLOG);

        //make sure our internal security permissions only allow recording telemetry and accessing the debug log
        memset(&azcore_sec_data, 0, sizeof(azcore_sec_data));
        memcpy(azcore_sec_data.component_id, &azcore_comp_id, sizeof(azcore_comp_id));
        azcore_sec_data.capabilities = AZURE_SPHERE_CAP_RECORD_TELEMETRY
                                     | AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY;
        azure_sphere_security_setprocattr("exec", &azcore_sec_data, sizeof(azcore_sec_data));
    }
}
#endif

static bool az_ptrace_has_cap(const struct cred *cred, struct user_namespace *ns,
			   unsigned int mode)
{
	int ret;

	if (mode & PTRACE_MODE_NOAUDIT)
		ret = security_capable(cred, ns, CAP_SYS_PTRACE, CAP_OPT_NOAUDIT);
	else
		ret = security_capable(cred, ns, CAP_SYS_PTRACE, CAP_OPT_NONE);

	return ret == 0;
}

// LSM entry only called on ptrace_attach and a small subset of /proc entries impacting if you can see other PIDs
static int azure_sphere_ptrace_access_check(struct task_struct *child, unsigned int mode)
{
    struct mm_struct *mm;
    const struct cred *cred = current_cred();
    bool ret;
    struct azure_sphere_task_cred *child_tsec;
    struct azure_sphere_task_cred *self_tsec;

    // if CAP_SYS_PTRACE is active then allow
    rcu_read_lock();
    ret = az_ptrace_has_cap(cred, __task_cred(child)->user_ns, mode);
    rcu_read_unlock();
    if (ret) {
        // check if the user_ns is accessible for the task memory
        mm = child->mm;
        if (mm && az_ptrace_has_cap(cred, mm->user_ns, mode)) {
                return 0;
        }
    }

    // make sure that the capabilities of the process is a superset of the process being traced to avoid elevating privileges
    child_tsec = get_task_cred(child)->security;
    self_tsec = get_task_cred(current)->security;
    if(!child_tsec || !self_tsec || ((child_tsec->capabilities & self_tsec->capabilities) != child_tsec->capabilities))
        return -EPERM;

    // if pluton says we are in development mode then allow otherwise fail
    if(!azure_sphere_in_dev_mode()) {
        return -EPERM;
    }

    return 0;
}

// LSM entry only called on ptrace_traceme
static int azure_sphere_ptrace_traceme(struct task_struct *parent)
{
    // if pluton says we are in development mode then allow otherwise fail
    if(azure_sphere_in_dev_mode()) {
        return 0;
    }

    return -EPERM;
}

static struct security_hook_list azure_sphere_hooks[] = {
    LSM_HOOK_INIT(task_setpgid, azure_sphere_task_setpgid),
    LSM_HOOK_INIT(cred_alloc_blank, azure_sphere_cred_alloc_blank),
    LSM_HOOK_INIT(cred_free, azure_sphere_cred_free),
    LSM_HOOK_INIT(cred_prepare, azure_sphere_cred_prepare),
    LSM_HOOK_INIT(cred_transfer, azure_sphere_cred_transfer),
    LSM_HOOK_INIT(getprocattr, azure_sphere_security_getprocattr),
    LSM_HOOK_INIT(setprocattr, azure_sphere_security_setprocattr),
#ifdef CONFIG_AZURE_SPHERE_MMAP_EXEC_PROTECTION
    LSM_HOOK_INIT(mmap_file, azure_sphere_mmap_file),
    LSM_HOOK_INIT(file_mprotect, azure_sphere_file_mprotect),
#endif
    LSM_HOOK_INIT(socket_bind, azure_sphere_socket_bind),
#ifdef CONFIG_COREDUMP
    LSM_HOOK_INIT(bprm_committing_creds, bprm_committing_creds_hook),
#endif
    LSM_HOOK_INIT(ptrace_access_check, azure_sphere_ptrace_access_check),
    LSM_HOOK_INIT(ptrace_traceme, azure_sphere_ptrace_traceme),

#ifdef CONFIG_AZURE_SPHERE_ATTR
    LSM_HOOK_INIT(task_alloc, azure_sphere_task_alloc),
    LSM_HOOK_INIT(task_free, azure_sphere_task_free),
#endif
};

static int __init azure_sphere_lsm_init(void)
{
    // Setup init perms
    azure_sphere_cred_init_security();

    security_add_hooks(azure_sphere_hooks, ARRAY_SIZE(azure_sphere_hooks), "azure_sphere");

    // Modify default security settings for the kernel
    kptr_restrict = 1;
    dmesg_restrict = 1;
    sysctl_protected_hardlinks = 1;
    sysctl_protected_symlinks = 1;
    sysctl_protected_fifos = 2;
    sysctl_protected_regular = 2;

    return 0;
}

DEFINE_LSM(azure_sphere) = {
    .name = "azure_sphere",
	.init = azure_sphere_lsm_init,
};
