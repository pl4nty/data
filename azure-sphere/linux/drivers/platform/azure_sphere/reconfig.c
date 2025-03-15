/*
 * Derived from pSeries_reconfig.c - support for dynamic reconfiguration (including PCI
 * Hotplug and Dynamic Logical Partitioning on RPA platforms).
 *
 * Copyright (C) 2005 Nathan Lynch
 * Copyright (C) 2005 IBM Corporation
 *
 *
 *	This program is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU General Public License version
 *	2 as published by the Free Software Foundation.
 */

#include <linux/kernel.h>
#include <linux/notifier.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
#include <linux/of.h>


/**
 * derive_parent - basically like dirname(1)
 * @path:  the full_name of a node to be added to the tree
 *
 * Returns the node which should be the parent of the node
 * described by path.  E.g., for path = "/foo/bar", returns
 * the node with full_name = "/foo".
 */
static struct device_node *derive_parent(const char *path)
{
	struct device_node *parent;
	char *parent_path = "/";
	const char *tail;

	/* We do not want the trailing '/' character */
	tail = kbasename(path) - 1;

	/* reject if path is "/" */
	if (!strcmp(path, "/")) {
		pr_err("Failed: %s %d\n", __func__, __LINE__);
		return ERR_PTR(-EINVAL);
	}

	if (tail > path) {
		parent_path = kstrndup(path, tail - path, GFP_KERNEL);
		if (!parent_path) {
			pr_err("Failed: %s %d\n", __func__, __LINE__);
			return ERR_PTR(-ENOMEM);
		}
	}

	parent = of_find_node_by_path(parent_path);

	kfree(parent_path);
	if (!parent) {
		pr_err("Failed: %s %d\n", __func__, __LINE__);
	}
	return parent ? parent : ERR_PTR(-EINVAL);
}

/*
	Given a path to the new node and the associated property list,
	add a new node to the device tree.

	Note: This function is derived from pSeries_reconfig_add_node.
*/
int reconfig_add_node(const char *path, struct property *proplist)
{
	struct device_node *np;
	int err = -ENOMEM;

	np = kzalloc(sizeof(*np), GFP_KERNEL);
	if (!np) {
		pr_err("Failed: %s %d\n", __func__, __LINE__);
		goto out_err;
	}

	// Freed via of_node_release when the kobject reference count decrements.
	np->full_name = kstrdup(path, GFP_KERNEL);
	if (!np->full_name) {
		pr_err("Failed: %s %d\n", __func__, __LINE__);
		goto out_err;
	}

	np->properties = proplist;
	of_node_set_flag(np, OF_DYNAMIC);
	of_node_init(np);

	np->parent = derive_parent(path);
	if (IS_ERR(np->parent)) {
		err = PTR_ERR(np->parent);
		pr_err("Failed: %s %d\n", __func__, __LINE__);
		goto out_err;
	}

	err = of_attach_node(np);
	if (err) {
		pr_err("Failed: %s %d\n", __func__, __LINE__);
		goto out_err;
	}

	of_node_put(np->parent);
	return 0;

out_err:
	if (np) {
		of_node_put(np->parent);
		kfree(np->full_name);
		kfree(np);
	}
	return err;
}

/*
	Detaches a node from the device tree.

	Note that this function does not drop any reference
	held by the caller, so the node itself is not freed until
	the caller runs of_node_put one last time.

	Note: This function is derived from pSeries_reconfig_remove_node.
*/
int reconfig_remove_node(struct device_node *np)
{
	struct device_node *parent, *child;
	int err = 0;

	parent = of_get_parent(np);
	if (!parent) {
		err = -EINVAL;
		goto done;
	}

	if ((child = of_get_next_child(np, NULL))) {
		of_node_put(child);
		of_node_put(parent);
		err = -EBUSY;
		goto done;
	}

	of_detach_node(np);
	of_node_put(parent); // of_get_parent above
	of_node_put(np); // of_node_init in reconfig_add_node

done:
	return err;
}

/*
	Create and return a new device tree node property.

	This function is useful for constructing a property list for
	association with a device tree node.  For example, use the returned
	pointer as input to reconfig_add_node, above.

	name: Name of the property.  NULL-terminated.  This function does
		not take ownership of this pointer.
	length: Length of the property data.
	value: Array of bytes of length "length".  This function does not take
		ownership of this pointer.
	last: An existing property list to prepend this property to.  Travese
		the list via the struct property->next member.
*/
struct property *new_property(const char *name, const int length,
				     const unsigned char *value, struct property *last)
{
	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);

	if (!new)
		return NULL;

	if (!(new->name = kstrdup(name, GFP_KERNEL)))
		goto cleanup;
	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
		goto cleanup;

	// Add a NULL-terminator to the value.
	// Store the length as is, which excludes the NULL.
	memcpy(new->value, value, length);
	*(((char *)new->value) + length) = 0;
	new->length = length;
	new->next = last;
	return new;

cleanup:
	kfree(new->name);
	kfree(new->value);
	kfree(new);
	return NULL;
}
