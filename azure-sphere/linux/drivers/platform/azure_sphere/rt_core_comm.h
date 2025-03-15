// SPDX-License-Identifier: GPL-2.0
/*
 * Azure Sphere Real Time Core communication APIs
 *
 * Copyright (c) 2019 Microsoft Corporation. All rights reserved.
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

// Tracking struct for real time communication drivers
struct azsphere_realtime_communication_provider {
    // Start communication
    int (*start)(int core, const u8 *component_id);
    // Stop communication
    int (*stop)(int core);
};


///
/// Register a RT core communication provider
/// @provider - provider instance
///
int azpshere_realtime_communication_register_provider(struct azsphere_realtime_communication_provider *provider);

///
/// Unregister a RT core communication provider
/// @provider - provider instance
///
void azpshere_realtime_communication_unregister_provider(struct azsphere_realtime_communication_provider *provider);

///
/// Start Real time core communication
///
/// @core - the code id of the application running on the Real time core
int azpshere_realtime_communication_start(int core, const u8 *component_id);

///
/// Stop Real time core communication
///
/// @core - the code id of the application running on the Real time core
int azpshere_realtime_communication_stop(int core);
