// SPDX-License-Identifier: GPL-2.0
/*
 * Pluton driver using separate mailboxes for TX and RX.
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

#ifdef CONFIG_PLUTON_MAILBOX_DEBUG

// Set DEBUG to 1 to enable debug log output
#define DEBUG 1

#endif

#include <linux/device.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/kernel.h>
#include <linux/mailbox_client.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/platform_device.h>
#include <linux/skbuff.h>
#include <linux/spinlock_types.h>
#include <linux/timer.h>
#include <linux/types.h>
#include <azure-sphere/pluton_remoteapi.h>

#include "pluton_remoteapi_provider.h"

#define DRIVER_NAME "pluton-over-mailbox"

// Our basic device state structure
struct pluton_mailbox_state {
	// Our clients to the mailbox controller
	struct mbox_client tx_client;
	struct mbox_client rx_client;

	// Mailbox channels
	struct mbox_chan *tx_channel;
	struct mbox_chan *rx_channel;

	// The underlying linux kernel device
	struct device *dev;
};

static struct pluton_mailbox_state *g_pluton;

///
/// Callback fired when the mailbox has data
///
/// @cl - mbox_client for the mailbox
/// @mesg - Data from the mailbox in the form of a u32
static void pluton_rx_callback(struct mbox_client *cl, void *mesg)
{
	u32 *mailboxData = (u32 *)mesg;

	if (mailboxData == NULL)
		return;

	// Proxy off to remote API for processing
	pluton_remoteapi_incoming_message(*mailboxData);
}

static int pluton_send_message(uintptr_t message)
{
	int ret = SUCCESS;
	u32 *mailboxCmd = NULL;

	mailboxCmd = kmalloc(sizeof(*mailboxCmd), GFP_KERNEL);
	if (mailboxCmd == NULL) {
		ret = -ENOMEM;
		goto exit;
	}

	*mailboxCmd = message;

	// Send the message
	ret = mbox_send_message(g_pluton->tx_channel, mailboxCmd);
	if (ret > 0) {
		// Returns > 0 for success, map it back to 0 so the caller isn't
		// confused
		ret = SUCCESS;
	}

exit:
	if (ret != SUCCESS) {
		if (mailboxCmd != NULL) {
			kfree(mailboxCmd);
		}
	}

	return ret;
}

static struct pluton_remoteapi_provider pluton_provider = {
	.send_message = pluton_send_message
};

///
/// Initialize the pluton driver
///
/// @pdev - Platform device for this module
/// @returns -  0 for success
static int pluton_probe(struct platform_device *pdev)
{
	struct pluton_mailbox_state *pluton;
	int ret = SUCCESS;

	// Allocate memory for our driver state
	pluton = devm_kzalloc(&pdev->dev, sizeof(*pluton), GFP_KERNEL);
	if (!pluton) {
		return -ENOMEM;
	}

	pluton->dev = &pdev->dev;

	pluton->tx_client.dev = pluton->dev;
	pluton->tx_client.tx_block = true;
	pluton->tx_client.tx_tout = 200; //ms
	pluton->tx_client.knows_txdone = false;

	pluton->rx_client.dev = pluton->dev;
	pluton->rx_client.rx_callback = pluton_rx_callback;

	// Get our mailbox channels
	pluton->tx_channel = mbox_request_channel(&pluton->tx_client, 0);
	pluton->rx_channel = mbox_request_channel(&pluton->rx_client, 1);

	// Note these can and will fail early on with -EPROBE_DEFER if the mailbox isn't ready
	if (IS_ERR(pluton->tx_channel)) {
		ret = PTR_ERR(pluton->tx_channel);
		goto exit;
	}
	if (IS_ERR(pluton->rx_channel)) {
		ret = PTR_ERR(pluton->rx_channel);
		goto exit;
	}

	platform_set_drvdata(pdev, pluton);

	// Set up our global pointer, this will be used by the remote API
	g_pluton = pluton;

	dev_info(pluton->dev, "Starting pluton-over-mailbox driver");

	pluton_provider.dev = pluton->dev;

	ret = pluton_remoteapi_register_provider(&pluton_provider);

exit:
	if (ret != SUCCESS) {
		g_pluton = NULL;
		platform_set_drvdata(pdev, NULL);

		if (pluton != NULL) {
			devm_kfree(&pdev->dev, pluton);
		}
	}

	return ret;
}

///
/// Teardown the pluton driver
///
/// @pdev - Platform device for this module
/// @returns -  0 for success
static int pluton_remove(struct platform_device *pdev)
{
	struct pluton_mailbox_state *pluton = platform_get_drvdata(pdev);

	if (!pluton) {
		return -EINVAL;
	}

	pluton_remoteapi_unregister_provider(&pluton_provider);

	mbox_free_channel(pluton->tx_channel);
	mbox_free_channel(pluton->rx_channel);

	return SUCCESS;
}

static const struct of_device_id pluton_over_mailbox_match[] = {
	{ .compatible = "microsoft,pluton-over-mailbox" },
	{ /* Sentinel */ },
};

MODULE_DEVICE_TABLE(of, pluton_over_mailbox_match);

static struct platform_driver pluton_over_mailbox_driver = {
    .probe = pluton_probe,
    .remove = pluton_remove,
    .driver =
	{
	    .name = DRIVER_NAME, .of_match_table = pluton_over_mailbox_match,
	},
};

module_platform_driver(pluton_over_mailbox_driver);

MODULE_LICENSE("GPLv2");
MODULE_DESCRIPTION("Pluton over mailbox driver");
MODULE_AUTHOR("Azure Sphere Team <azuresphereoss@microsoft.com>");
MODULE_ALIAS("platform:pluton-over-mailbox");
