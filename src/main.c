#ifndef _LINUX_CORE_
#define _LINUX_CORE_

#include <linux/module.h>
#include <linux/kernel.h> // Needed for printk()
#include <linux/init.h>   // Needed for the macros

// Forward declarations of Ada functions
extern void ada_init_module(void);
extern void ada_cleanup_module(void);

// Module initialization function
static int __init my_init(void)
{
    ada_init_module();
    return 0;
}

// Module cleanup function
static void __exit my_exit(void)
{
    ada_cleanup_module();
}

// Specify the init and exit functions
module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");

#endif /* _LINUX_CORE_ */

