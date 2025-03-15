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

#ifdef CONFIG_PLUTON_REMOTEAPI_DEBUG

// Set DEBUG to 1 to enable debug log output
#define DEBUG 1

#endif

#include <linux/device.h>
#include <linux/dma-mapping.h>
#include <linux/dmapool.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/spinlock_types.h>
#include <linux/slab.h>
#include <linux/string.h>
#include <linux/timer.h>
#include <linux/types.h>
#include <azure-sphere/pluton_remoteapi.h>

#include "pluton_remoteapi_provider.h"
#include <uapi/linux/azure-sphere/syscall.h>
#include "security_monitor.h"

#define COMPLETION_TIMEOUT_IN_MS (25000)

// Response data for a completion callback
struct pluton_relay_completion_data {
	// Completion object
	struct completion *completion;
};

// Housekeeping structure for tracking relay info objects
struct pluton_relay_management_info {
	// Our response data
	struct pluton_relay_completion_data response_data;
	// List pointer
	struct list_head list;
	// Message address - used to execute callbacks
	uintptr_t message;
};

// Token representing an outstanding mailbox transfer.  Leverages the exising encoded mailbox command.
typedef uintptr_t pluton_tranfer_token;

struct pluton_remoteapi_state {
	// linked list for relay management items
	struct list_head relay_management_list;
	// Lock construct for relay objects
	spinlock_t relay_lock;
	// Provider pointer
	struct pluton_remoteapi_provider *provider;
};

static struct pluton_remoteapi_state g_state;

///
/// Initialization of Remote API
///
int pluton_remoteapi_init(void)
{
	int ret = SUCCESS;

	spin_lock_init(&g_state.relay_lock);
	INIT_LIST_HEAD(&g_state.relay_management_list);

    // if we have the app or software dev bits set in pluton then indicate we are in dev mode
    // this is to avoid syscall race condition issues. Any capability change results in a device
    // reboot so caching of this state is acceptable
    if ((azure_sphere_has_pluton_capability(PLUTON_DEVICE_CAPABILITY_ENABLE_CUSTOMER_APP_DEV) == 1) ||
       (azure_sphere_has_pluton_capability(PLUTON_DEVICE_CAPABILITY_ENABLE_SYSTEM_SOFTWARE_DEV) == 1)) {
        set_azure_sphere_in_dev_mode(true);
    }

	return ret;
}

///
/// Shuts down Remote API
///
void pluton_remoteapi_shutdown(void)
{
}

///
/// Allocate and initialize new management info item
///
/// @returns -  New item
static struct pluton_relay_management_info *
pluton_remote_api_alloc_relay_management_info(void)
{
	struct pluton_relay_management_info *ret = NULL;

	ret = devm_kzalloc(g_state.provider->dev, sizeof(*ret), GFP_KERNEL);
	if (ret) {
		// Initialize list pointer
		INIT_LIST_HEAD(&ret->list);
	}

	return ret;
}

///
/// Gets the management info item for a sequence number.
/// IMPORTANT: The item is removed from the management info list and the
///            caller is responsible for freeing item memory when finshed.
///
/// @message - message address
/// @returns -  Item that matches the number or NULL
static struct pluton_relay_management_info *
pluton_remote_api_get_relay_management_info(uintptr_t message)
{
	struct pluton_relay_management_info *mgmt_item = NULL;
	struct pluton_relay_management_info *ret = NULL;
	unsigned long flags;

	// Acquire lock
	spin_lock_irqsave(&g_state.relay_lock, flags);

	list_for_each_entry(mgmt_item, &g_state.relay_management_list,
			    list)
	{
		if (mgmt_item->message == message) {

			// Remove from list
			list_del(&mgmt_item->list);

			ret = mgmt_item;
			break;
		}
	}

	// Release lock
	spin_unlock_irqrestore(&g_state.relay_lock, flags);

	return ret;
}

///
/// Frees a management info item.  Note that the item should already be removed from the management info list.
///
/// @item - item to free
static void pluton_remote_api_free_management_info(struct pluton_relay_management_info *item) 
{
	unsigned long flags;

	// Acquire lock
	spin_lock_irqsave(&g_state.relay_lock, flags);

	// Free
	devm_kfree(g_state.provider->dev, item);

	// Release lock
	spin_unlock_irqrestore(&g_state.relay_lock, flags);
}

///
/// Gets a free relay management info item
///
/// @returns -  Item to use
static struct pluton_relay_management_info *
pluton_remote_api_get_free_relay_management_info(void)
{
	struct pluton_relay_management_info *ret = NULL;
	unsigned long flags;

	// Allocate our new item
	ret = pluton_remote_api_alloc_relay_management_info();
	if (ret != NULL) {
		// Acquire lock
		spin_lock_irqsave(&g_state.relay_lock, flags);

		list_add(&ret->list, &g_state.relay_management_list);

		// Release lock
		spin_unlock_irqrestore(&g_state.relay_lock, flags);
	}

	return ret;
}

///
/// Dispatches an incoming message
///
/// @cmd - Command ID
void pluton_remoteapi_incoming_message(uintptr_t message)
{
	struct pluton_relay_management_info *mgmt_item = NULL;

	// Get mgmt item for this operation
	mgmt_item =
	    pluton_remote_api_get_relay_management_info(message);
	if (mgmt_item == NULL) {
		dev_dbg(g_state.provider->dev,
			"Response message %p not found.  It may have been removed by a cancellation.",
			(void *)message);
		return;
	}

	// Signal we're done
	complete_all(mgmt_item->response_data.completion);

	// Free memory
	pluton_remote_api_free_management_info(mgmt_item);
}

///
/// Checks if the RemoteAPI has been initialized and is ready for use
///
/// @returns - 0 if ready, -EPROBE_DEFER or a simlar error if not
int pluton_remote_api_is_ready(void)
{
	if (g_state.provider == NULL) {
		// We're not initialized yet
		return -EPROBE_DEFER;
	}

	return 0;
}

///
/// Cancels the response from an earlier command sent to the M4
///
/// @transfer_token - Token identifying the transfer response to be cancelled
/// @returns -  0 for success
static int pluton_remoteapi_cancel_response_from_pluton(pluton_tranfer_token transfer_token)
{
	struct pluton_relay_management_info *mgmt_info = NULL;

	// Validate handle
	if (g_state.provider == NULL) {
		return -EINVAL;
	}

	// Validate transfer token
	if (transfer_token == 0) {
		dev_err(g_state.provider->dev, "Invalid transfer token passed to "
					     "pluton_remoteapi_cancel_response_from_pluton");
		return -EINVAL;
	}

	mgmt_info = pluton_remote_api_get_relay_management_info(transfer_token);
	if (mgmt_info == NULL)
	{
		return -EINVAL;
	}

	// Free the queued relay management entry.
	pluton_remote_api_free_management_info(mgmt_info); 

	// Note that we don't release the tx buffer here.  Releasing it runs the risk that ours has already transferred
	// and that we're releasing someone elses in the same ring buffer location.  The buffer will normally be released when 
	// the M4 finally responds. The downside is that if it never responds, we won't but then there are bigger problems.
	return SUCCESS;
}

///
/// Sends a message to Pluton
///
/// @message - pointer to message to send
/// @returns -  0 for success
static int pluton_remote_api_send_impl(uintptr_t message, 
	struct pluton_relay_completion_data response_data)
{
	int ret = SUCCESS;
	struct pluton_relay_management_info *mgmt_info = NULL;

	// Validate handle
	if (g_state.provider == NULL) {
		printk(KERN_ERR "RemoteAPI provider not available\n");
		return -EINVAL;
	}

	// Get a free relay info structure to set up
	mgmt_info = pluton_remote_api_get_free_relay_management_info();
	if (mgmt_info == NULL) {
		dev_err(g_state.provider->dev, "Could not allocate relay info in "
					     "pluton_remote_api_send");
		return -ENOMEM;
	}

	// build out relay structure
	mgmt_info->message = message;
	mgmt_info->response_data = response_data;

	// Send the message
	ret = g_state.provider->send_message(message);

	if (ret != SUCCESS) {
		dev_err(g_state.provider->dev,
			"Failed to send Pluton command %p with error: %d", (void *)message, ret);

		pluton_remote_api_free_management_info(mgmt_info);
	}

	return ret;
}

///
/// Sends a packet of data to Pluton and blocks on a response
///
/// @message - message pointer
/// @returns - 0 for success
int pluton_remote_api_send(uintptr_t message)
{
	struct completion c;
	int ret;
	u32 time_remaining = 0;

	struct pluton_relay_completion_data response_data = {
	    .completion = &c
	};

	init_completion(&c);

	// Send command
	ret = pluton_remote_api_send_impl(message, response_data);
	if (ret != SUCCESS) {
		return ret;
	}

	// Requests should get resposnes in a small amount of time (usec or msc)
	// We put a timeout here to catch cases where a response never comes.
	// This is always unexpected but we WARN and return so we can recover.
	time_remaining =
	    wait_for_completion_timeout(&c, msecs_to_jiffies(COMPLETION_TIMEOUT_IN_MS));

	// The wait completion routine can internally return a negative number if we receive a fatal/cancel signal.  Converted
	// to an unsigned value, it's large.  Warn on it here but don't specifically try to cancel a response request since there
	// would be a larger scope clean-up happening anyways.
	WARN_ON(time_remaining > msecs_to_jiffies(COMPLETION_TIMEOUT_IN_MS));

	// Warn if a time-out occurs.
	WARN_ON(time_remaining == 0);

	if (time_remaining == 0) {
		// Cancel the transfer response since it may not come.  If we fail to cancel the transfer, we can't exit otherwise
		// we risk a memory fault should the completion handler fire after we've returned.
		if (pluton_remoteapi_cancel_response_from_pluton(message) == SUCCESS)
		{
			dev_dbg(g_state.provider->dev,
				"Successfully cancelled M4 response request following a wait timeout.\n");

			return -ETIMEDOUT;
		}

		dev_dbg(g_state.provider->dev,
				"Failed to cancel M4 response request following a wait timeout, waiting for completion...\n");

		// Wait without time-out.
		wait_for_completion(&c);
	}

	return SUCCESS;
}

///
/// Register a remoteapi data provider
/// @provider - provider instance
///
int pluton_remoteapi_register_provider(struct pluton_remoteapi_provider *provider)
{
	g_state.provider = provider;

	return pluton_remoteapi_init();
}

///
/// Unregister a remoteapi data provider
/// @provider - provider instance
///
void pluton_remoteapi_unregister_provider(struct pluton_remoteapi_provider *provider)
{
	if (g_state.provider == provider) {
		g_state.provider = NULL;

		pluton_remoteapi_shutdown();
	}
}
