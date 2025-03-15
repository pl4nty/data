#include <linux/device.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/dma-mapping.h>
#include <linux/platform_device.h>
#include <linux/arm-smccc.h>
#include <linux/uaccess.h>
#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include <azure-sphere/security.h>
#include <uapi/linux/azure-sphere/security_monitor.h>
#include <linux/of.h>
#include <linux/syscalls.h>
#include <linux/mtd/mtd.h>
#include <linux/genhd.h>
#include <linux/namei.h>
#include <linux/uuid.h>

#include "reconfig.h"
#include "security_monitor.h"
#include "sm_generic.h"

// Used for finding the base/length of a flash image.
struct azure_sphere_component_id_flash_info {
	u64 base;
	u64 length;
	u8 component_uid[16];
};

// Format one of the components of a GUID string.
static void format_component(size_t *i, const char *component_id, size_t component_len, char *output_buf, size_t output_buf_len, bool be) {
	size_t local_offset;
	size_t start_index = *i;
	size_t start, end, inc;
	char intermediate[8];

	if (be) {
		start = component_len - 1;
		end = -1;
		inc = -1;
	}
	else {
		start = 0;
		end = component_len;
		inc = 1;
	}

	for (local_offset = start; local_offset != end; local_offset += inc) {
		*i = start_index + local_offset;

		// Create intermediate buffer:
		snprintf(intermediate, sizeof(intermediate), "%02X", component_id[*i]);

		// Concatenate up to remaining_buf_len characters.
		// strncat in the kernel guarantees null-termination.
		strlcat(output_buf, intermediate, output_buf_len);
	}

	*i = start_index + component_len;
}

// Convert a 16-byte component ID into a human-readable string.
// Assumes the component_id parameter corresponds to a 16-byte array.
// Guarantees output string is null-terminated.  The string orders the
// bytes according to the "Variant 2" GUID format, which is "mixed endian."
// Leaves out the dashes.
static char *print_component_id_as_hex(const uint8_t *component_id, char *output_buf, size_t output_buf_len) {
	size_t i = 0;
	const size_t component_id_len = 16;

	const size_t component_1_len = 4;
	const size_t component_2_len = 2;
	const size_t component_3_len = 2;
	const size_t component_4_len = 2;
	const size_t component_5_len = 6;

	output_buf[0] = 0;

	if (output_buf_len < component_id_len) {
		return NULL;
	}

	format_component(&i, component_id, component_1_len, output_buf, output_buf_len, true);
	format_component(&i, component_id, component_2_len, output_buf, output_buf_len, true);
	format_component(&i, component_id, component_3_len, output_buf, output_buf_len, true);
	format_component(&i, component_id, component_4_len, output_buf, output_buf_len, false);
	format_component(&i, component_id, component_5_len, output_buf, output_buf_len, false);

	return output_buf;
}

// Find the path to the MTD device.
// The resulting string can serve as input to the mount() system call.
static int find_mtd_path(char *mtd_path, size_t mtd_path_length, int index) {
	int err = 0;
	struct path path;

	snprintf(mtd_path, mtd_path_length, "/dev/mtdblock%d", index);
	err = kern_path(mtd_path, LOOKUP_FOLLOW, &path);
	if (err) {
		// Errors expected on this path: it's likely mtdblock does not exist.
		snprintf(mtd_path, mtd_path_length, "/dev/mtd%d", index);
		err = kern_path(mtd_path, LOOKUP_FOLLOW, &path);

		if (err) {
			pr_err("Error: %s %d kern_path(%s) failed\n", __FUNCTION__, __LINE__, mtd_path);
		}
		else {
			// Replace /dev/mtd%d with mtd%d.
			// The higher level will mount it by name rather than path.
			// Note that this string is not actually a path, but the mount
			// command will accept it.
			snprintf(mtd_path, mtd_path_length, "mtd%d", index);
			path_put(&path);
		}
	}
	else {
		path_put(&path);
	}

	return err;
}

// Given information about an image and its flash information,
// returns the component ID as a string, as well as its flash
// address and length.
static struct property *create_property_list(
	const struct azure_sphere_component_id_flash_info *found_image,
	char *component_id_str,
	size_t component_id_str_length,
	uint64_t *image_base,
	uint64_t *image_length) {

	uint8_t new_read_only;
	struct {
		uint64_t base;
		uint64_t length;
	} image_regs;

	struct prop_data {
		char *name;
		uint32_t length;
		const void *value;
	};
	struct prop_data props[4];
	struct property *prop = NULL;
	const char *name;
	size_t i;

	new_read_only = 0;
	props[0].name = "read-only";
	props[0].length = sizeof(new_read_only);
	props[0].value = &new_read_only;

	// Example continued:
	// found_image->base is some offset into the flash, e.g. 0x00001234.
	image_regs.base = found_image->base;
	image_regs.length = found_image->length;
	props[1].name = "reg";
	props[1].length = sizeof(image_regs);
	props[1].value = &image_regs;

	if (image_base)
		*image_base = image_regs.base;
	if (image_length)
		*image_length = image_regs.length;

	print_component_id_as_hex(found_image->component_uid, component_id_str, component_id_str_length);
	props[2].name = "label";
	props[2].length = strlen(component_id_str);
	props[2].value = component_id_str;

	name = "partition";
	props[3].name = "name";
	props[3].length = strlen(name);
	props[3].value = name;

	for (i = 0; i < 4; i++) {
		struct property *last = prop;
		prop = new_property(props[i].name, props[i].length, props[i].value, last);
		if (!prop) {
			pr_err("Error: %s %d. Unable to create property", __FUNCTION__, __LINE__);
			prop = last;
			goto out;
		}
	}

out:
	return prop;
}

//
// Create an entry in /dev for the application provided.
// Return a path that can be mounted.
//
// found_image: The ImageInfo from security monitor.
// mtd_path / mtd_path_length: output parameters that will
//     hold a string the application can pass to the mount()
//     system call.
static int add_device_tree_node(
	const struct azure_sphere_component_id_flash_info *found_image,
	char *mtd_path,
	size_t mtd_path_length) {
	char node_path[128];
	struct device_node *flash_node = NULL;
	struct property *prop = NULL;
	int err = 0;
	struct mtd_info *mtd_device_info;
	char component_id_str[64];
	uint64_t image_base;

	// Find the /flash@xyz node in the device tree
	flash_node = of_find_node_by_name(NULL, "flash");
	if (!flash_node) {
		pr_err("Error: %s %d\n", __FUNCTION__, __LINE__);
		return -EINVAL;
	}

	prop = create_property_list(
		found_image,
		component_id_str,
		sizeof(component_id_str),
		&image_base,
		NULL);
	if (!prop) {
		pr_err("Error: %s %d\n", __FUNCTION__, __LINE__);
		err = -ENOMEM;
		goto out;
	}

	// Name the node.  Include flash offset to ensure uniqueness.
	// Note the underlying device tree implementatino checks for uniqueness
	// and will rename it if there's a collision for some reason, but that shouldn't
	// happen, and nothing relies on the name anyway.
	sprintf(node_path, "/%s/partition@%llx", flash_node->full_name, image_base);
	err = reconfig_add_node(node_path, prop);
	if (err) {
		goto out;
	}

	pr_debug("Component ID path: %s, node_path:%s, flash_node: %s\n",
		component_id_str, node_path, flash_node->full_name);

	// Get the mtd_info given the component ID string.  This string names
	// the MTD device. With that, find the path to the device.
	mtd_device_info = get_mtd_device_nm(component_id_str);

	// Populate the out parameter.  Drop the reference count on
	// the mtd_device_info after it's done, and return any error.
	if (!IS_ERR(mtd_device_info)) {
		err = find_mtd_path(mtd_path, mtd_path_length, mtd_device_info->index);

		if (!err) {
			put_mtd_device(mtd_device_info);
		}
	} else {
		err = PTR_ERR(mtd_device_info);
	}

out:
	of_node_put(flash_node);
	return err;
}

int azure_sphere_map_app_to_dev(const uint8_t *component_id, char *dev_path, size_t dev_path_length) {
	int err = -ENOMEM;
	struct azure_sphere_component_id_flash_info image;
	char mtd_path[128];

	memset(&image, 0, sizeof(image));
	memcpy(image.component_uid, component_id, sizeof(image.component_uid));

	err = azure_sphere_sm_get_image_details((const guid_t *) &image.component_uid, &image.base, &image.length);
	if (err != 0) {
		// Translate security monitor error to Linux
		pr_err("Error: %s %d, No matching image found, err: %d\n", __FUNCTION__, __LINE__, err);
		err = -EINVAL;
		goto out;
	}

	err = add_device_tree_node(&image, mtd_path, sizeof(mtd_path));
	if (err != 0) {
		goto out;
	}

	// Copy up to dev_path_length characters and guarantee the result is NULL-terminated.
	strlcpy(dev_path, mtd_path, dev_path_length);

out:
	return err;
}
EXPORT_SYMBOL_GPL(azure_sphere_map_app_to_dev);

static int remove_device_tree_node(const uint8_t *component_id) {
	int err = -ENOMEM;
	char mtd_name[128];
	struct device_node *flash_node = NULL;
	struct device_node *cur_child = NULL;
	static const size_t component_id_str_len = 32;

	flash_node = of_find_node_by_name(NULL, "flash");
	if (!flash_node) {
		pr_err("Error: %s %d flash not found\n", __FUNCTION__, __LINE__);
		return -EINVAL;
	}

	print_component_id_as_hex(component_id, mtd_name, sizeof(mtd_name));
	pr_debug("%s component ID: %s\n", __FUNCTION__, mtd_name);

	for (;;) {
		struct property *cur_property = NULL;
		cur_child = of_get_next_child(flash_node, cur_child);
		if (cur_child == NULL) {
			err = 0;
			break;
		}

		cur_property = of_find_property(cur_child, "label", NULL);
		if (cur_property == NULL) {
			err = 0;
			of_node_put(cur_child);
			break;
		}

		if (cur_property->length == component_id_str_len && strcmp(cur_property->value, mtd_name) == 0) {
			pr_debug("Matched.  Node: %s, label:%s. len:%d\n", cur_child->full_name, cur_child->name, cur_property->length);
			reconfig_remove_node(cur_child);
			of_node_put(cur_child);
			break;
		} else {
			pr_debug("No match.  Node: %s, label:%s, len:%d\n", cur_child->full_name, cur_child->name, cur_property->length);
		}
	}

	of_node_put(flash_node);
	return 0;
}

int azure_sphere_unmap_app_to_dev(const uint8_t *component_id) {
	return remove_device_tree_node(component_id);
}
EXPORT_SYMBOL_GPL(azure_sphere_unmap_app_to_dev);
