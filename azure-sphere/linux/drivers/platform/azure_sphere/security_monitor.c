// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Security Monitor API
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
#define DEBUG 1
#endif

#include <linux/device.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/platform_device.h>
#include <linux/dma-mapping.h>
#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include <azure-sphere/security.h>
#include <uapi/linux/azure-sphere/security_monitor.h>
#include <linux/of.h>
#include <linux/syscalls.h>
#include <linux/mtd/mtd.h>
#include <linux/genhd.h>
#include <linux/namei.h>

#include "reconfig.h"
#include "security_monitor.h"
#include "watchdog.h"
#include "sm_generic.h"

#define DRIVER_NAME "azure-sphere-security-monitor"

// Global pointers to device.
static struct platform_device *g_sm_pdev = NULL;
struct device *g_sm_dev = NULL;
bool g_azure_sphere_in_dev_mode = false;

///
/// Queries info about flash.
///
/// @flash_info - On success, receives info.
/// @returns - 0 for success
int azure_sphere_sm_query_flash(struct azure_sphere_sm_flash_info *flash_info)
{
	int err = 0;
	struct security_monitor_query_flash_result result = {0};
    struct azure_sphere_syscall args = {0};

    args.number = SMSyscallQueryFlash;
    args.flags = MakeFlagsForArg(0, Output | Reference) | MakeFlagsForArg(1, Input);
    args.args[0] = (uintptr_t)&result;
	args.args[1] = sizeof(result);

	dev_dbg(g_sm_dev, "Security Monitor call: QUERY_FLASH");

	/*
	 * Call into the security monitor.
	 */

	err = azure_sphere_sm_execute_syscall(&args, false);

	dev_dbg(g_sm_dev,
			"Security Monitor call: QUERY_FLASH returned %#x", err);

	if (err) {
		return err;
	}

	/*
	 * Fill out the provided structure with the information we received
	 * from the security monitor.
	 */

	memset(flash_info, 0, sizeof(*flash_info));

	flash_info->length = result.length;
	flash_info->erase.min_length = result.min_erase_length;
	flash_info->erase.preferred_length = result.preferred_erase_length;
	flash_info->erase.max_length = result.max_erase_length;
	flash_info->write.min_length = result.min_write_length;
	flash_info->write.preferred_length = result.preferred_write_length;
	flash_info->write.max_length = result.max_write_length;
	flash_info->supports_xip = result.supports_xip;

	return 0;
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_query_flash);

///
/// Reads from flash.
///
/// @start_offset - Start offset for read.
/// @length - Number of bytes to read.
/// @data - Pointer to the data that is read.
/// @returns - 0 for success
int azure_sphere_sm_read_flash(u64 start_offset, size_t length, void *data)
{
	int err;
	struct azure_sphere_syscall args = {0};

	args.number = SMSyscallReadFlash;
    args.flags = MakeFlagsForArg(0, Input | Reference)
		| MakeFlagsForArg(1, Input)
		| MakeFlagsForArg(2, Output | Pointer)
		| MakeFlagsForArg(3, Input);
    args.args[0] = (uintptr_t)&start_offset;
	args.args[1] = sizeof(start_offset);
	args.args[2] = (uintptr_t)data;
	args.args[3] = length;

	dev_dbg(g_sm_dev, "Security Monitor call: READ_FLASH -->");

	if (data == NULL) {
		dev_err(g_sm_dev, "Invalid data buffer");
		return -EINVAL;
	}

	/*
	 * Call into security monitor.
	 */

	err = azure_sphere_sm_execute_syscall(&args, false);

	dev_dbg(g_sm_dev,
			"Security Monitor call: READ_FLASH returned %#x", err);

	return err;
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_read_flash);

///
/// Erases a portion of flash.
///
/// @start_offset - Starting offset to start erasing at.
/// @length - Number of bytes to erase.
/// @returns - 0 for success
int azure_sphere_sm_erase_flash(u64 start_offset, u64 length)
{
	int err;
	struct azure_sphere_syscall args = {0};

    args.number = SMSyscallEraseFlash;
    args.flags = MakeFlagsForArg(0, Input | Reference)
		| MakeFlagsForArg(1, Input)
		| MakeFlagsForArg(2, Input | Reference)
		| MakeFlagsForArg(3, Input);
    args.args[0] = (uintptr_t)&start_offset;
	args.args[1] = sizeof(start_offset);
	args.args[2] = (uintptr_t)&length;
	args.args[3] = sizeof(length);

	dev_dbg(g_sm_dev, "Security Monitor call: ERASE_FLASH");

	err = azure_sphere_sm_execute_syscall(&args, false);

	dev_dbg(g_sm_dev,
			"Security Monitor call: ERASE_FLASH returned %#x", err);

	return err;
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_erase_flash);

///
/// Writes to flash.
///
/// @start_offset - Starting offset to start writing at.
/// @length - Number of bytes to write.
/// @data - Pointer to the data to write.
/// @returns - 0 for success
int azure_sphere_sm_write_flash(u64 start_offset, size_t length, const void *data)
{
	int err;
	struct azure_sphere_syscall args = {0};

	args.number = SMSyscallWriteFlash;
    args.flags = MakeFlagsForArg(0, Input | Reference)
		| MakeFlagsForArg(1, Input)
		| MakeFlagsForArg(2, Input | Pointer)
		| MakeFlagsForArg(3, Input);
    args.args[0] = (uintptr_t)&start_offset;
	args.args[1] = sizeof(start_offset);
	args.args[2] = (uintptr_t)data;
	args.args[3] = length;

	dev_dbg(g_sm_dev, "Security Monitor call: WRITE_FLASH -->");

	if (data == NULL) {
		dev_err(g_sm_dev, "Invalid data buffer");
		return -EINVAL;
	}

	/*
	 * Call into security monitor.
	 */

	err = azure_sphere_sm_execute_syscall(&args, false);

	dev_dbg(g_sm_dev,
			"Security Monitor call: WRITE_FLASH returned %#x", err);

	return err;
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_write_flash);

///
/// Verify linear-cramfs image.
///
/// @flash_address - the flash address of the image to verify.
/// @returns - 0 on success; a negative error code otherwise.
int azure_sphere_sm_verify_image_by_flash_address(u64 flash_address)
{
	struct azure_sphere_syscall args = {0};
    args.number = SMSyscallVerifyImageByFlashAddress;
    args.flags = MakeFlagsForArg(0, Input | Reference) | MakeFlagsForArg(1, Input);

    args.args[0] = (uintptr_t)&flash_address;
	args.args[1] = sizeof(flash_address);

    return azure_sphere_sm_execute_syscall(&args, false);
}

struct DeriveKeyResult {
    uint8_t key[32];
    uint32_t instance;
    uint32_t generation;
};

///
/// Derive Key
///
/// @returns - noreturn on success; a negative error code otherwise.
int azure_sphere_sm_derive_key(void *client_uid, u32 generation_delta, void *key, u32 *instance, u32 *generation)
{
	struct azure_sphere_syscall args = {0};
	struct DeriveKeyResult result = {0};
	int err = 0;

    // Validate inputs.
	if ((key == NULL) || (instance == NULL) || (generation == NULL)) {
		dev_err(g_sm_dev, "Invalid input pointer(s)");
		err = -EINVAL;
        goto cleanup;
	}

    args.number = SMSyscallDeriveKey;
    args.flags = MakeFlagsForArg(0, Input | Reference)
		| MakeFlagsForArg(1, Input)
		| MakeFlagsForArg(2, Input)
		| MakeFlagsForArg(3, Output | Reference)
		| MakeFlagsForArg(4, Input);

    args.args[0] = (uintptr_t)client_uid;
	args.args[1] = sizeof(guid_t);
	args.args[2] = generation_delta;
	args.args[3] = (uintptr_t)&result;
	args.args[4] = sizeof(result);

    err = azure_sphere_sm_execute_syscall(&args, false);

	dev_dbg(g_sm_dev,
			"Security Monitor call: DERIVE_KEY returned %#x", err);

	if (err != 0)
		goto cleanup;

	memcpy(key, result.key, sizeof(result.key));
	*instance = result.instance;
	*generation = result.generation;

cleanup:
	memzero_explicit(&result, sizeof(result));

	return err;
}

///
/// Gets details about an image
///
/// @guid    - Image component UID
/// @address - The address of the image.
/// @length  - The length of the image.
/// @returns - 0 on success; a negative error code otherwise.
int azure_sphere_sm_get_image_details(const guid_t *guid, u64 *address, u64 *length)
{
	struct azure_sphere_syscall args = {0};
	int err = 0;

	if (address == NULL || length == NULL){
		return -EINVAL;
	}

	args.number = SMSyscallFindImageGivenComponentId;
	args.flags = MakeFlagsForArg(0, Input | Reference)
	    | MakeFlagsForArg(1, Input)
		| MakeFlagsForArg(2, Output | Reference)
		| MakeFlagsForArg(3, Input)
		| MakeFlagsForArg(4, Output | Reference)
		| MakeFlagsForArg(5, Input);
	args.args[0] = (uintptr_t) guid;
	args.args[1] = sizeof(*guid);
	args.args[2] = (uintptr_t) address;
	args.args[3] = sizeof(*address);
	args.args[4] = (uintptr_t) length;
	args.args[5] = sizeof(*length);
	err = azure_sphere_sm_execute_syscall(&args, false);

	if (err != 0) {
		dev_err(g_sm_dev, "Failed to find image: %d", err);
		goto cleanup;
	}

cleanup:
	return err;
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_get_image_details);

///
/// Starts an IO core
///
/// @core_id - The IO Core instance to control
/// @guid - The component ID to start
/// @returns - 0 for success, non-zero for failure
int azure_sphere_sm_io_core_start(int core, const guid_t *guid, uintptr_t flash_offset, size_t flash_size, uint32_t flags)
{
	struct azure_sphere_syscall args = {0};
    args.number = SMSyscallStartRtCoreByComponentId;
    args.flags = MakeFlagsForArg(0, Input)
		| MakeFlagsForArg(1, Input | Reference)
	    | MakeFlagsForArg(2, Input)
		| MakeFlagsForArg(3, Input)
		| MakeFlagsForArg(4, Input)
		| MakeFlagsForArg(5, Input);

    args.args[0] = core;
	args.args[1] = (uintptr_t) guid;
	args.args[2] = sizeof(*guid);
	args.args[3] = flash_offset;
	args.args[4] = flash_size;
	args.args[5] = flags;

    return azure_sphere_sm_execute_syscall(&args, false);
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_io_core_start);

///
/// Stops an IO core
///
/// @core_id - The IO Core instance to control
/// @returns - 0 for success, non-zero for failure
int azure_sphere_sm_io_core_stop(int core)
{
	struct azure_sphere_syscall args = {0};
    args.number = SMSyscallStopRtCore;
    args.flags = MakeFlagsForArg(0, Input);

    args.args[0] = core;

    return azure_sphere_sm_execute_syscall(&args, false);
}

EXPORT_SYMBOL_GPL(azure_sphere_sm_io_core_stop);
/// Configures a communication buffer for an IO Core
///
/// @core - The IO Core instance to control
/// @type - The type of the communication buffer
/// @physical_address - The physical address of the communication buffer
/// @size - The size of the communication buffer
/// @returns - 0 for success, non-zero for failure
///
int azure_sphere_sm_io_core_configure_communication_buffer(int core, uint32_t type, uintptr_t physical_address, loff_t size)
{
	struct azure_sphere_syscall args = {0};
    args.number = SMSyscallSetRtCoreCommunicationBuffer;
    args.flags = MakeFlagsForArg(0, Input)
		| MakeFlagsForArg(1, Input)
		| MakeFlagsForArg(2, Input)
		| MakeFlagsForArg(3, Input);

    args.args[0] = core;
	args.args[1] = type;
	args.args[2] = physical_address;
	args.args[3] = size;

    return azure_sphere_sm_execute_syscall(&args, false);
}
EXPORT_SYMBOL_GPL(azure_sphere_sm_io_core_configure_communication_buffer);

///
/// Initializes our Security Monitor client driver
///
/// @pdev - Platform device pointer for this module
/// @returns - 0 for success
static int azure_sphere_sm_probe(struct platform_device *pdev)
{
	int err;
	u32 version = 0xFFFFFFFF;
	struct azure_sphere_syscall args = {0};

	// Stash away the device pointer in a global so we can access it from
	// the APIs we export from this module.
	g_sm_dev = &pdev->dev;

	dev_info(g_sm_dev,
			 "Starting Azure Sphere Security Monitor client driver");

	err = dma_set_coherent_mask(g_sm_dev, DMA_BIT_MASK(32));
	if (err) {
		dev_err(g_sm_dev,
				"dma_set_coherent_mask failed: %d", err);
		return err;
	}

	args.number = SMSyscallGetVersion;
	args.flags = MakeFlagsForArg(0, Output | Reference)
		| MakeFlagsForArg(1, Input);
	args.args[0] = (uintptr_t)&version;
	args.args[1] = sizeof(version);

	err = azure_sphere_sm_execute_syscall(&args, false);
	if (err) {
		dev_err(g_sm_dev,
				"Could not communicate with security monitor: %d", err);
		return err;
	}

	dev_info(g_sm_dev, "Detected security monitor version: %u",
			 version);

	// The security monitor will get updated prior to the NWOS and is always
	// backwards compatible; therefore, any version greater or equal to
	// the NW's current security monitor version is supported.
	if (version < SECURITY_MONITOR_CURRENT_VERSION) {
		dev_err(
			g_sm_dev,
			"Unsupported Security Monitor version: expected %u, saw %u",
			SECURITY_MONITOR_CURRENT_VERSION, version);

		g_sm_dev = NULL;
		return -ENODEV;
	}

	azsphere_watchdog_init();

	return 0;
}

///
/// Teardown our Security Monitor client driver
///
/// @pdev - Platform device pointer for this module
/// @returns - 0 for success
static int azure_sphere_sm_remove(struct platform_device *pdev)
{
	// We don't need to clean anything up as part of tear down.
	return 0;
}

// Driver metadata.
static struct platform_driver azure_sphere_sm_driver = {
	.probe = azure_sphere_sm_probe,
	.remove = azure_sphere_sm_remove,
	.driver = {.name = DRIVER_NAME}};

static int __init azure_sphere_sm_init(void)
{
	int err;

	err = platform_driver_register(&azure_sphere_sm_driver);
	if (err)
		return err;

	g_sm_pdev =
		platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
	if (IS_ERR(g_sm_pdev)) {
		err = PTR_ERR(g_sm_pdev);
		platform_driver_unregister(&azure_sphere_sm_driver);

		return err;
	}

	return 0;
}

static void __exit azure_sphere_sm_exit(void)
{
	if (g_sm_pdev)
		platform_device_unregister(g_sm_pdev);

	platform_driver_unregister(&azure_sphere_sm_driver);
}

void set_azure_sphere_in_dev_mode(bool state)
{
	g_azure_sphere_in_dev_mode = state;
}

bool azure_sphere_in_dev_mode(void)
{
    return g_azure_sphere_in_dev_mode;
}

postcore_initcall(azure_sphere_sm_init);
module_exit(azure_sphere_sm_exit);

MODULE_LICENSE("GPLv2");
MODULE_DESCRIPTION("Azure Sphere Security Monitor client driver");
MODULE_AUTHOR("Azure Sphere Team <azuresphereoss@microsoft.com>");
MODULE_ALIAS("platform:azure-sphere-security-monitor");
