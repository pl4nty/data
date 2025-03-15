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

#include <linux/device.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/lsm_hooks.h>
#include <linux/binfmts.h>
#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include <azure-sphere/coredump.h>

#ifdef CONFIG_COREDUMP

// Declared in fs/coredump.c.  Ordinarily, this is writable via sysctl, but
// Azure Sphere builds with CONFIG_SYSCTL disabled.
extern char core_pattern[];

static int __init azure_sphere_core_pattern_init(void)
{
	// Maximum length is CORENAME_MAX_SIZE (128)
	strcpy(core_pattern, AZCORE_PATTERN);
	return 0;
}

postcore_initcall(azure_sphere_core_pattern_init);

#endif // CONFIG_COREDUMP

int azure_sphere_enable_coredump(const struct azure_sphere_enable_coredumps *p)
{
#ifdef CONFIG_COREDUMP
	// Default to opted out of coredump collection
	strcpy(core_pattern, AZCORE_PATTERN);
	if (p->enable) {
		// Opted in: append the tenant ID.  Caution: it is not
		// null-terminated.
		static_assert(sizeof(AZCORE_PATTERN)+sizeof(p->tenant_id)+1 < CORENAME_MAX_SIZE);
		core_pattern[sizeof(AZCORE_PATTERN)-1] = ' ';
		memcpy(core_pattern+sizeof(AZCORE_PATTERN), p->tenant_id, sizeof(p->tenant_id));
		core_pattern[sizeof(AZCORE_PATTERN)+sizeof(p->tenant_id)+0] = ' ';
		core_pattern[sizeof(AZCORE_PATTERN)+sizeof(p->tenant_id)+1] = p->region;
		core_pattern[sizeof(AZCORE_PATTERN)+sizeof(p->tenant_id)+2] = '\0';
	}
#endif
	return 0;
}

MODULE_LICENSE("GPLv2");
MODULE_DESCRIPTION("Azure Sphere core_pattern initializer");
MODULE_AUTHOR("Azure Sphere Team <azuresphereoss@microsoft.com>");
MODULE_ALIAS("platform:azure-sphere-core-pattern");
