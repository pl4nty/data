// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere DAA operations driver
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

#ifdef CONFIG_AZURE_SPHERE_SECUIRTY_MONITOR_DEBUG
// Set DEBUG to 1 to enable debug log output
#define DEBUG 1
#endif

#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/skbuff.h>
#include <uapi/linux/azure-sphere/pluton.h>
#include <azure-sphere/pluton_remoteapi.h>
#include <linux/slab.h>
#include <linux/cred.h>
#include <azure-sphere/security.h>

#include "caller_security.h"
#include "sm_user.h"
#include "attestation_runtime_operations.h"
#include "pluton.h"

///
/// PLUTON_SIGN_WITH_TENANT_ATTESTATION_KEY message handler
///
/// @arg - ioctl buffer
/// @data - file data for FD
/// @async - is the FD in async mode
/// @returns - 0 for success
int pluton_sign_with_tenant_attestation_key(void __user *arg) {
    u32 ret = 0;
    struct azure_sphere_syscall args = {0};
    struct azure_sphere_task_cred *tsec;
    struct azure_sphere_tenant_id tenant_id;
    struct azure_sphere_digest digest;
    struct azure_sphere_ecdsa_signature signature;

    // no runtime permission check

    ret = copy_from_user(&digest, arg, sizeof(digest));
    if (unlikely(ret)) {
        return ret;
    }

    // copy out the tenant id
    tsec = current->cred->security;
    memcpy(&tenant_id, tsec->daa_tenant_id, sizeof(tenant_id));

    args.number = PlutonSyscallSignWithTenantKey;
    args.flags = MakeFlagsForArg(0, Input | Reference)
        | MakeFlagsForArg(1, Input)
        | MakeFlagsForArg(2, Input | Reference)
        | MakeFlagsForArg(3, Input)
        | MakeFlagsForArg(4, Output | Reference)
        | MakeFlagsForArg(5, Input);
    args.args[0] = (uintptr_t)&tenant_id;
    args.args[1] = sizeof(tenant_id);
    args.args[2] = (uintptr_t)&digest;
    args.args[3] = sizeof(digest);
    args.args[4] = (uintptr_t)&signature;
    args.args[5] = sizeof(signature);

    ret = azure_sphere_pluton_execute_syscall(&args, false);

    // no data sent back on err
    if (!ret) {
        ret = copy_to_user(arg, &signature, sizeof(signature));
    }

    return ret;
}