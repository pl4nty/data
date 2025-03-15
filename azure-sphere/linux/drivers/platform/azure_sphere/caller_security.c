// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Security Monitor security policy
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

#include <linux/kernel.h>
#include <linux/device.h>
#include <linux/cred.h>
#include <linux/sched.h>
#include <linux/security.h>
#include <asm/uaccess.h>
#include <linux/slab.h>
#include <azure-sphere/security.h>

#include <uapi/linux/azure-sphere/syscall.h>
#include "security_monitor.h"
#include "pluton.h"
#include "caller_security.h"
#include "sm_user.h"

typedef struct
{
    u16 number;
    azure_sphere_capability_t caps;
    u32 linux_caps;
} azure_sphere_sm_syscall_permission_t;

// Any command not listed here cannot be called by user space
static azure_sphere_sm_syscall_permission_t azure_sphere_sm_syscall_required_capabilities[] = {
    {.number = SMSyscallWriteLog, .caps = 0, .linux_caps = CAP_SYSLOG},
    {.number = SMSyscallGetLogDataSize, .caps = AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY, .linux_caps = 0},
    {.number = SMSyscallGetLogData, .caps = AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY, .linux_caps = 0},
    {.number = SMSyscallDeriveKey, .caps = AZURE_SPHERE_CAP_SFS, .linux_caps = 0},
    {.number = SMSyscallGetApplicationImageCount, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallListAllApplicationImages, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallInvalidateImage, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallOpenImageForStaging, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallWriteBlockToStageImage, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallCommitImageStaging, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallAbortImageStaging, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallInstallStagedImages, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetComponentCount, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetComponentSummary, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetComponentImages, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallStageComponentManifests, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetCountOfMissingImagesToDownload, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetMissingImagesToDownload, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetABITypeCount, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallGetABIVersions, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallGetUpdateCertStoreImageInfo, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallStageBaseManifests, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetCountOfMissingBaseImagesToDownload, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallGetMissingBaseImagesToDownload, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallStartRtCoreByComponentId, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallStopRtCore, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallSetRtCoreCommunicationBuffer, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallGetSoftwareRollbackInfo, .caps = AZURE_SPHERE_CAP_UPDATE_IMAGE, .linux_caps = 0},
    {.number = SMSyscallRecordTelemetryEventData, .caps = AZURE_SPHERE_CAP_RECORD_TELEMETRY, .linux_caps = 0},
    {.number = SMSyscallGetTelemetry, .caps = AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY, .linux_caps = 0},
    {.number = SMSyscallResetTelemetry, .caps = AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY, .linux_caps = 0},
    {.number = SMSyscallRetainTelemetry, .caps = AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY, .linux_caps = 0},
    {.number = SMSyscallPeripheralAcquire, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallPeripheralRelease, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallPeripheralGetAvailableDomains, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallPeripheralLockConfig, .caps = AZURE_SPHERE_CAP_PERIPHERAL_PIN_MAPPING, .linux_caps = 0},
    {.number = SMSyscallFindImageGivenComponentId, .caps = AZURE_SPHERE_CAP_QUERY_IMAGE_INFO, .linux_caps = 0},
    {.number = SMSyscallGetTelemetryStartTime, .caps = AZURE_SPHERE_CAP_MANAGE_LOG_AND_TELEMETRY, .linux_caps = 0},
};

static azure_sphere_sm_syscall_permission_t
   azure_sphere_pluton_syscall_required_capabilities[] = {
      { .number = PlutonSyscallSetPostcode,
        .caps = AZURE_SPHERE_CAP_POSTCODE,
        .linux_caps = 0 },
      { .number = PlutonSyscallGetBootModeFlags,
        .caps = 0,
        .linux_caps = 0 },
      { .number = PlutonSyscallGetSecurityState,
        .caps = 0,
        .linux_caps = 0 },
      { .number = PlutonSyscallIsCapabilityEnabled,
        .caps = 0,
        .linux_caps = 0 },
      { .number = PlutonSyscallGetEnabledCapabilities,
        .caps = 0,
        .linux_caps = 0 },
      { .number = PlutonSyscallGetManufacturingState,
        .caps = AZURE_SPHERE_CAP_UPDATE_SECURITY_STATE,
        .linux_caps = 0 },
      { .number = PlutonSyscallSetManufacturingState,
        .caps = AZURE_SPHERE_CAP_UPDATE_SECURITY_STATE,
        .linux_caps = 0 },
      { .number = PlutonSyscallGenerateClientAuthKey,
        .caps = AZURE_SPHERE_CAP_ATTESTATION_RUNTIME,
        .linux_caps = 0 },
      { .number = PlutonSyscallCommitClientAuthKey,
        .caps = AZURE_SPHERE_CAP_ATTESTATION_RUNTIME,
        .linux_caps = 0 },
      { .number = PlutonSyscallGetTenantPublicKey,
        .caps = 0,
        .linux_caps = 0 },
      { .number = PlutonSyscallPersistClientAuthKey,
        .caps = AZURE_SPHERE_CAP_ATTESTATION_RUNTIME,
        .linux_caps = 0 },
      { .number = PlutonSyscallRestoreClientAuthKey,
        .caps = AZURE_SPHERE_CAP_ATTESTATION_RUNTIME,
        .linux_caps = 0 },
      { .number = PlutonSyscallDecodeCapabilities,
        .caps = 0,
        .linux_caps = 0 },
      { .number = PlutonSyscallGetAttestationData,
        .caps = AZURE_SPHERE_CAP_ATTESTATION_RUNTIME,
        .linux_caps = 0 },
      { .number = PlutonSyscallSignAttestationData,
        .caps = AZURE_SPHERE_CAP_ATTESTATION_RUNTIME,
        .linux_caps = 0 },
   };

bool azure_sphere_caller_has_capabilities_for_syscall(u16 syscall) {
    bool result = true;
    u32 i;
    azure_sphere_sm_syscall_permission_t *entry = NULL;
    for (i = 0; i < ARRAY_SIZE(azure_sphere_sm_syscall_required_capabilities); i++) {
        azure_sphere_sm_syscall_permission_t *cmd_caps = &azure_sphere_sm_syscall_required_capabilities[i];
        if (cmd_caps->number == syscall) {
            entry = cmd_caps;
            break;
        }
    }

    if (entry == NULL) {
        // Deny by default
        return false;
    }

    if (entry->caps) {
        result &= azure_sphere_capable(entry->caps);
    }
    if (entry->linux_caps) {
        result &= capable(entry->linux_caps);
    }

    return result;
}

bool azure_sphere_caller_has_capabilities_for_pluton_syscall(u16 syscall) {
    bool result = true;
    u32 i;
    azure_sphere_sm_syscall_permission_t *entry = NULL;
    for (i = 0; i < ARRAY_SIZE(azure_sphere_pluton_syscall_required_capabilities); i++) {
        azure_sphere_sm_syscall_permission_t *cmd_caps = &azure_sphere_pluton_syscall_required_capabilities[i];
        if (cmd_caps->number == syscall) {
            entry = cmd_caps;
            break;
        }
    }

    if (entry == NULL) {
        // Deny by default
        return false;
    }

    if (entry->caps) {
        result &= azure_sphere_capable(entry->caps);
    }
    if (entry->linux_caps) {
        result &= capable(entry->linux_caps);
    }

    return result;
}

int azure_sphere_has_pluton_capability(int capability)
{
    int ret;
    struct azure_sphere_syscall args = {0};
    bool has_capability;

    args.number = PlutonSyscallIsCapabilityEnabled;
    args.flags = MakeFlagsForArg(0, Input)
        | MakeFlagsForArg(1, Output | Reference)
        | MakeFlagsForArg(2, Input);
    args.args[0] = capability;
    args.args[1] = (uintptr_t)&has_capability;
    args.args[2] = sizeof(has_capability);

    ret = azure_sphere_pluton_execute_syscall(&args, false);

    // if we failed then return -1
    if (ret != 0)
        return -1;

    // return if the capability is set, do a check for it being set
    // so that we don't run the risk of returning -1 if pluton ever set all bits
    if(has_capability)
        return 1;

    return 0;
}
