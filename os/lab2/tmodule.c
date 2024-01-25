#include <linux/init.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/namei.h>
#include <linux/kernel.h>
#include <linux/dcache.h>

#include "tmodule.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Artem Shulga");
MODULE_DESCRIPTION("new lsblk");

const int MYMAJOR = 22;

static void print_device(const struct my_device* my_device) {
    printk("\nDevice: %s\n", my_device->name);
    printk("Size: %d\n", my_device->size);
}

static long driver_ioctl(struct file* file, unsigned int cmd, unsigned long arg) {
    struct my_device my_device = {0};
    switch(cmd) {
        case RD_MY_DEVICES:
            pr_info("SOMEBODY READ ME!");

            struct file *fi = filp_open("/dev", O_RDONLY, 0);

            struct dentry * thedentry;
            thedentry = fi->f_path.dentry;
            struct dentry * curdentry;

            unsigned char * curname = NULL;

            list_for_each_entry(curdentry, &thedentry->d_subdirs, d_subdirs) {
                if (curdentry->d_inode != NULL && curdentry->d_inode->i_mode != NULL) {
                    if (!S_ISBLK(curdentry->d_inode->i_mode)) {
                        curname = curdentry->d_iname;
                        printk(KERN_INFO "Filename: %s \n", curname);
                    }
                }
            }
            filp_close(fi, NULL);
            pr_info("DIR CLOSED!");

            my_device.size = 2;
            my_device.name = "test";
            pr_info("%c\n", my_device.name[0]);
            print_device(&my_device);
            if (copy_to_user(arg, my_device.name, 5)) {
                pr_info("Data read error!\n");
            }
            pr_info("LOL\n");
            if (copy_to_user(arg, &my_device, sizeof(struct my_device))) {
                pr_info("Data read error!\n");
            }
            //filp_close(dir, NULL);
            break;
        default:
            pr_info("Command not found!");
            break;
    }
    return 0;
}

static struct file_operations fops = {
        .owner          = THIS_MODULE,
        .unlocked_ioctl = driver_ioctl,
};

// Custom init and exit methods
static int __init init(void) {
    pr_info("Hello world.");
    int retval = register_chrdev(MYMAJOR, "new_lsblk_driver", &fops);
    if (0 == retval) {
        printk("new_lsblk_driver device number Major:%d , Minor:%d\n", MYMAJOR, 0);
    }
    else if (retval > 0) {
        printk("new_lsblk_driver device number Major:%d , Minor:%d\n", retval >> 20, retval & 0xffff);
    }
    else {
        printk("Couldn't register device number!\n");
        return -1;
    }
    return 0;
}

static void __exit exit(void) {
    unregister_chrdev(MYMAJOR, "new_lsblk_driver");
    pr_info("Goodbye my friend, I shall miss you dearly...");
}

module_init(init);
module_exit(exit);