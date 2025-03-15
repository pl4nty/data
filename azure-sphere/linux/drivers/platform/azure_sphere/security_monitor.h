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

#pragma once

#include <linux/arm-smccc.h>
#include <linux/uuid.h>
#include <azure-sphere/security_monitor.h>

#define SECURITY_MONITOR_ENTITY (ARM_SMCCC_OWNER_TRUSTED_OS)

#define SECURITY_MONITOR_FUNCTION(async, function) \
	ARM_SMCCC_CALL_VAL(async, ARM_SMCCC_SMC_32, SECURITY_MONITOR_ENTITY, function)

// ARM_SMCCC_STD_CALL is the yielding call where as FAST is the synchronous call
#define SECURITY_MONITOR_API_ASYNC (ARM_SMCCC_STD_CALL)
#define SECURITY_MONITOR_API_SYNC  (ARM_SMCCC_FAST_CALL)

/*
 * API: version
 */

#define SECURITY_MONITOR_CURRENT_VERSION (1)

struct security_monitor_query_flash_result {
	u32 info_length;
	
	u64 length;

	u32 min_erase_length;
	u32 preferred_erase_length;
	u32 max_erase_length;

	u32 min_write_length;
	u32 preferred_write_length;
	u32 max_write_length;

	bool supports_xip;
};

/*
 * Add simple static assert that will be used to validate compatibility structs
 */
#ifndef static_assert
#define static_assert(x, y) \
    typedef int __security_monitor_static_assert[(x) ? 0 : -1]
#endif // static_assert

/*
 * Make sure security_monitor_query_flash_result only increases in length for compatibilty with SK calls
 */
static_assert(sizeof(struct security_monitor_query_flash_result) >= 40, "security_monitor_query_flash_result size changed");
static_assert(offsetof(struct security_monitor_query_flash_result, supports_xip) == 40, "security_monitor_query_flash_result layout changed");

struct security_monitor_image_info {
    u32 type;
    char name[16];
    u64 flash_address;
    u32 length_in_bytes;
    u32 replica_type;
    uuid_t component_uid;
    uuid_t image_uid;
    u32 uncompressed_length_in_bytes;
    u32 flags;
    u32 min_application_runtime_abi_version_required;
};

extern struct device *g_sm_dev;

void set_azure_sphere_in_dev_mode(bool state);