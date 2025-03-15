// SPDX-License-Identifier: GPL-2.0
/*
 * Pluton remote API
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
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/string.h>
#include <linux/types.h>

#include "rt_core_comm.h"

static struct azsphere_realtime_communication_provider *rt_provider = NULL;

///
/// Register a RT core communication provider
/// @provider - provider instance
///
int azpshere_realtime_communication_register_provider(struct azsphere_realtime_communication_provider *provider)
{
    if (!rt_provider) {
        rt_provider = provider;
        return 0;
    }

    if (rt_provider == provider) {
        return 0;
    }

    return -ENOMEM;
}

///
/// Unregister a RT core communication provider
/// @provider - provider instance
///
void azpshere_realtime_communication_unregister_provider(struct azsphere_realtime_communication_provider *provider)
{
    	if (rt_provider == provider) {
		    rt_provider = NULL;
        }
}

///
/// Start Real time core communication
///
/// @core - the code id of the application running on the Real time core
int azpshere_realtime_communication_start(int core, const u8 *component_id)
{
    if (!rt_provider)  {
        return -ENOSYS;
    }
        
    return rt_provider->start(core, component_id);
}

///
/// Stop Real time core communication
///
/// @core - the code id of the application running on the Real time core
int azpshere_realtime_communication_stop(int core)
{
    if (!rt_provider) {
        return -ENOSYS;
    }

    return rt_provider->stop(core);
}
