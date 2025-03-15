// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Security Monitor watchdog implementation
 *
 * Copyright (c) 2020 Microsoft Corporation. All rights reserved.
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


#include <linux/arm-smccc.h>
#include <linux/timer.h>

#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include "security_monitor.h"
#include "watchdog.h"

static struct timer_list g_sm_watchdog_timer;

#define AZSPHERE_WATCHDOG_TEND_INTERVAL_MS 40000

///
/// Start (or restart) the watchdog tend timer.
///
static inline void azsphere_watchdog_timer_start(void) {
    g_sm_watchdog_timer.expires =
        jiffies + msecs_to_jiffies(AZSPHERE_WATCHDOG_TEND_INTERVAL_MS);
    add_timer(&g_sm_watchdog_timer);
}

///
/// Tend the watchdog via SMC call to the Security Monitor.
///
static inline void azsphere_watchdog_tend(void) {
    struct azure_sphere_syscall args = {0};
    args.number = SMSyscallTendWatchdog;

    azure_sphere_sm_execute_syscall(&args, false);
}

///
/// Handle kernel timer callback by tending the watchdog and restarting the
/// timer.
///
void azsphere_watchdog_timer_handler(struct timer_list *t) {
    azsphere_watchdog_tend();
    azsphere_watchdog_timer_start();
}

///
/// Initialize the watchdog tend timer.
///
void azsphere_watchdog_init(void) {
    azsphere_watchdog_tend();
    timer_setup(&g_sm_watchdog_timer, azsphere_watchdog_timer_handler, 0);
    azsphere_watchdog_timer_start();
}

