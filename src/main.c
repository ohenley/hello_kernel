#ifndef _LINUX_CORE_
#define _LINUX_CORE_

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

extern void ada_init_module(void);
extern void ada_cleanup_module(void);

static int __init my_init(void)
{
    ada_init_module();
    return 0;
}

static void __exit my_exit(void)
{
    ada_cleanup_module();
}

module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");

#endif /* _LINUX_CORE_ */

