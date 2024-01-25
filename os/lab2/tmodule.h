#define RD_MY_DEVICES _IOR('a', 'c', struct my_device*)

struct my_device {
    char *name;
    uint64_t size;
    uint64_t type;
    uint64_t mountpoints;
};