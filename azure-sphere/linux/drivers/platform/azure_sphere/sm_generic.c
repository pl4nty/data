// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Security Monitor user interface driver
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

#ifdef CONFIG_AZURE_SPHERE_SECURITY_MONITOR_DEBUG
// Set DEBUG to 1 to enable debug log output
#define DEBUG 1
#endif

#include <linux/device.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/file.h>
#include <linux/ctype.h>
#include <asm/uaccess.h>
#include <linux/platform_device.h>
#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include <uapi/linux/azure-sphere/security_monitor.h>
#include <azure-sphere/security.h>
#include <linux/skbuff.h>
#include <linux/fdtable.h>
#include <azure-sphere/pluton_remoteapi.h>
#include <linux/of.h>

#include "caller_security.h"
#include "sm_user.h"
#include "rt_core_comm.h"
#include <azure-sphere/coredump.h>

static struct device_node *find_peripheral_device_node(u16 peripheral_type, u16 peripheral_index)
{
	int ret;
	const char *type_str;
	char alias[16];
	struct device_node *device_node;

	switch (peripheral_type) {
	case AZURE_SPHERE_UART:
		type_str = "serial";
		break;
	case AZURE_SPHERE_I2C_MASTER:
		type_str = "i2c";
		break;
	case AZURE_SPHERE_SPI_MASTER:
		type_str = "spi";
		break;
	case AZURE_SPHERE_PWM:
		type_str = "pwm";
		break;
	case AZURE_SPHERE_ADC:
		type_str = "adc";
		break;
	default:
		return ERR_PTR(-EINVAL);
	}

	ret = snprintf(alias, sizeof(alias), "%s%u", type_str, (u32)peripheral_index);
	if (ret <= 0 || ret >= sizeof(alias))
		return ERR_PTR(-ENOMEM);

	device_node = of_find_node_opts_by_path(alias, NULL);
	if (!device_node) {
		dev_err(g_sm_user->dev, "Could not find node in device tree: %s\n", alias);
		return ERR_PTR(-ENOENT);
	}

	return device_node;
}

static int security_monitor_enable_peripheral_driver(void __user* arg)
{
	int ret = 0;
	struct azure_sphere_enable_peripheral_driver command_data;
	struct device_node *node = NULL;
	
	if (!azure_sphere_capable(AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING)) {
		return -EPERM;
	}

	ret = copy_from_user(&command_data, arg, sizeof(command_data));
	if (unlikely(ret))
		return ret;

	dev_info(g_sm_user->dev, "%s driver for peripheral 0x%x:0x%x\n",
		command_data.enable ? "Probing" : "Removing",
		(u32)command_data.peripheral_type,
		(u32)command_data.peripheral_index);

	node = find_peripheral_device_node(command_data.peripheral_type,
		command_data.peripheral_index);
	if (IS_ERR(node)) {
		// Device doesn't need to be disabled if it doesn't exist
		if (command_data.enable) {
			dev_err(g_sm_user->dev, "failed to find peripheral node: 0x%x ret=%ld\n",
					command_data.peripheral_type, PTR_ERR(node));
			return PTR_ERR(node);
		} else {
			dev_info(g_sm_user->dev, "peripheral to disable not found, continuing without error: 0x%x\n",
					command_data.peripheral_type);
			return 0;
		}
	}

	dev_info(g_sm_user->dev, "Found device node: %s\n",
		node->full_name ? node->full_name : node->name);

	ret = of_device_set_available(node, command_data.enable);
	if (ret) {
		dev_err(g_sm_user->dev, "failed to update OF device enablement for peripheral 0x%x:0x%x; ret=%d\n",
			(u32)command_data.peripheral_type, (u32)command_data.peripheral_index, ret);
		return ret;
	}

	return 0;
}

///
/// SECURITY_MONITOR_DERIVE_KEY message handler
///
/// @arg - input data
/// @returns - 0 for success

int security_monitor_derive_key_command(void __user *arg)
{
	u32 ret = 0;
	struct azure_sphere_derive_key command_data;
    struct azure_sphere_guid component_id;

	ret = copy_from_user(&command_data, arg, sizeof(command_data));
	if (unlikely(ret)) {
		return ret;
	}

	command_data.result.status_code = -EIO;

	if (!azure_sphere_capable(AZURE_SPHERE_CAP_SFS)) {
		dev_err(g_sm_user->dev, "%s sender not allowed to access SFS API\n", __FUNCTION__);
		goto exit;
	}

    //if no security entry then fail, we shouldn't get here but just incase
    if (!azure_sphere_get_component_id(&component_id, current)) {
		dev_err(g_sm_user->dev, "%s error accessing security credentials\n", __FUNCTION__);
        goto exit;
    }

	command_data.result.status_code = azure_sphere_sm_derive_key(&component_id, command_data.request.generation_delta,
		&command_data.result.key, &command_data.result.instance, &command_data.result.generation);

exit:
	ret = copy_to_user(arg, &command_data, sizeof(command_data));
	memzero_explicit(&command_data, sizeof(command_data));

	return ret;
}

static int get_physical_address_of_file_mapping(unsigned int fd, uintptr_t *value, loff_t *size)
{
	int result = 0;
	struct file *file;
	struct address_space *mapping;
	struct inode *inode;

	file = fget(fd);

	if (file) {
		mapping = file->f_mapping;
		if (!mapping->a_ops->bmap) {
			result = -EINVAL;
		}
		else {
			inode = mapping->host;

			inode_lock(inode);
			if (inode->i_state & I_DIRTY)
				result = -ETXTBSY;
			inode_unlock(inode);

			if (result == 0) {
				*value = mapping->a_ops->bmap(mapping, 0);
				*size = i_size_read(inode);
			}
		}

		fput(file);
	} else {
		result = -ENOENT;
	}

	return result;
}

int security_monitor_io_core_control(void __user *arg)
{
	int result;
	uintptr_t flash_offset;
	loff_t flash_size;
	struct azure_sphere_io_core_control command_data;

	result = copy_from_user(&command_data, arg, sizeof(command_data));
	if (unlikely(result)) {
		return result;
	}

	if (!azure_sphere_capable(AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING)) {
		dev_err(g_sm_user->dev, "%s sender not allowd to use IO core control API\n", __FUNCTION__);
		result = -EPERM;
		goto exit;
	}

	switch (command_data.request) {
	case AZURE_SPHERE_IO_CORE_CONTROL_RUN:
		azpshere_realtime_communication_stop(command_data.core);
		result = get_physical_address_of_file_mapping(command_data.fd, &flash_offset, &flash_size);
		if (result == 0) {
			result = azure_sphere_sm_io_core_start(command_data.core, (const guid_t *) command_data.component_id,
				flash_offset, flash_size, command_data.flags);
		}
		break;
	case AZURE_SPHERE_IO_CORE_CONTROL_STOP:
		azpshere_realtime_communication_stop(command_data.core);
		result = azure_sphere_sm_io_core_stop(command_data.core);
		break;
	case AZURE_SPHERE_IO_CORE_CONTROL_START_COMMUNICATION:
		result = azpshere_realtime_communication_start(command_data.core, command_data.component_id);
		break;
	default:
		result = -EINVAL;
		break;
	}
exit:

	return result;
}

int security_monitor_syscall(void __user *arg)
{
	int result = 0;
	struct azure_sphere_syscall packed_args = {};

	result = copy_from_user(&packed_args, arg, sizeof(packed_args));
	if (unlikely(result)) {
		goto exit;
	}

	// access control
	if (!azure_sphere_caller_has_capabilities_for_syscall(packed_args.number)) {
		result = EACCES;
		goto exit;
	}

	// Call the syscall handler
	result = azure_sphere_sm_execute_syscall(&packed_args, true);

	// Copy back results
	if (unlikely(copy_to_user(arg, &packed_args, sizeof(packed_args)))) {
		result = EFAULT;
		goto exit;
	}

exit:
	// Translate from linux error to common error
	return result < 0 ? -result : result;
}

int security_monitor_map_app_to_dev(void __user *arg)
{
	int result;
	struct azure_sphere_map_app_to_dev command_data;

	result = copy_from_user(&command_data, arg, sizeof(command_data));
	if (unlikely(result)) {
		return result;
	}

	// Require two capabilities
	if (!azure_sphere_capable(AZURE_SPHERE_CAP_QUERY_IMAGE_INFO) || !azure_sphere_capable(AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING)) {
		dev_err(g_sm_user->dev, "%s sender not allowed to access app mapping\n", __FUNCTION__);
		return -EPERM;
	}

	memset(command_data.dev_path, 0, sizeof(command_data.dev_path));

	result = azure_sphere_map_app_to_dev(
		command_data.component_id,
		command_data.dev_path,
		sizeof(command_data.dev_path));

	// On error here, don't copy anything back.  Just return the error.

	if (result == 0) {
		result = copy_to_user(arg, &command_data, sizeof(command_data));
		if (unlikely(result)) {
			return result;
		}
	}

	return result;
}

int security_monitor_unmap_app_to_dev(void __user *arg)
{
	int result;
	struct azure_sphere_unmap_app_to_dev command_data;

	result = copy_from_user(&command_data, arg, sizeof(command_data));
	if (unlikely(result)) {
		return result;
	}

	// Keep the permissions symmetric with MapAppToDev even though this
	// path does not call into security monitor at all.
	if (!azure_sphere_capable(AZURE_SPHERE_CAP_QUERY_IMAGE_INFO) || !azure_sphere_capable(AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING)) {
		dev_err(g_sm_user->dev, "%s sender not allowed to access app mapping\n", __FUNCTION__);
		return -EPERM;
	}

	result = azure_sphere_unmap_app_to_dev(command_data.component_id);

	// No need to copy anything back.
	return result;
}

int security_monitor_enable_coredumps(void __user *arg)
{
	int result;
	struct azure_sphere_enable_coredumps command_data;

	result = copy_from_user(&command_data, arg, sizeof(command_data));
	if (unlikely(result)) {
		return result;
	}

	if (!azure_sphere_capable(AZURE_SPHERE_CAP_ENABLE_COREDUMPS)) {
		dev_err(g_sm_user->dev, "%s sender not allowed to enable/disable coredumps\n", __FUNCTION__);
		return -EPERM;
	}

	return azure_sphere_enable_coredump(&command_data);
}

long security_monitor_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
{
	void __user *arg = (void __user *)arg_;

	switch (cmd) {
	case SECURITY_MONITOR_DERIVE_KEY:
		return security_monitor_derive_key_command(arg);
	case SECURITY_MONITOR_ENABLE_PERIPHERAL_DRIVER:
		return security_monitor_enable_peripheral_driver(arg);
	case SECURITY_MONITOR_IO_CORE_CONTROL:
		return security_monitor_io_core_control(arg);
	case SECURITY_MONITOR_SYSCALL:
		return security_monitor_syscall(arg);
	case SECURITY_MONITOR_MAP_APP_TO_DEV:
		return security_monitor_map_app_to_dev(arg);
	case SECURITY_MONITOR_UNMAP_APP_TO_DEV:
		return security_monitor_unmap_app_to_dev(arg);
	case SECURITY_MONITOR_ENABLE_COREDUMPS:
		return security_monitor_enable_coredumps(arg);
	default:
		return -EINVAL;
	}
}
