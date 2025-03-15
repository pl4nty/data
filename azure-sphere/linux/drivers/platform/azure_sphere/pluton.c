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

#include <linux/kernel.h>
#include <linux/skbuff.h>
#include <uapi/linux/azure-sphere/pluton.h>
#include <azure-sphere/pluton_remoteapi.h>

#include "caller_security.h"
#include "sm_user.h"
#include "attestation_runtime_operations.h"
#include "pluton.h"

static int pluton_syscall(void __user *arg)
{
	int result = 0;
	struct azure_sphere_syscall packed_args = {};

	result = copy_from_user(&packed_args, arg, sizeof(packed_args));
	if (unlikely(result)) {
		goto exit;
	}

	// access control
	if (!azure_sphere_caller_has_capabilities_for_pluton_syscall(packed_args.number)) {
		result = EACCES;
		goto exit;
	}

	// Call the syscall handler
	result = azure_sphere_pluton_execute_syscall(&packed_args, true);

	// Copy back results
	if (unlikely(copy_to_user(arg, &packed_args, sizeof(packed_args)))) {
		result = EFAULT;
		goto exit;
	}

exit:
	// Translate from linux error to common error
	return result < 0 ? -result : result;
}

long pluton_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
{
	void __user *arg = (void __user *)arg_;

	switch (cmd) {
	case PLUTON_SYSCALL:
		return pluton_syscall(arg);
	case PLUTON_SIGN_WITH_TENANT_ATTESTATION_KEY:
		return pluton_sign_with_tenant_attestation_key(arg);
	default:
		return -EINVAL;
	}
}
