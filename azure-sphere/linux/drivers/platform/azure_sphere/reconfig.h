#ifndef _RECONFIG_H_
#define _RECONFIG_H_

#include <linux/kernel.h>
#include <linux/notifier.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
#include <linux/of.h>

int reconfig_add_node(const char *path, struct property *proplist);
int reconfig_remove_node(struct device_node *np);
struct property *new_property(const char *name, const int length,
                const unsigned char *value, struct property *last);

#endif
