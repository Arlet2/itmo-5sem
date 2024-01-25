#include <sys/ioctl.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <fcntl.h>
#include <malloc.h>
#include <unistd.h>
#include <linux/ptrace.h>
#include <inttypes.h>

#include "tmodule.h"

int main(int argc, char *argv[]) {
    int fd;
    printf("\nOpening a driver...\n");
    fd = open("/dev/kvadra_t", O_RDWR);
    if (fd < 0) {
        printf("Cannot open device file:(\n");
        return 0;
    }
    struct my_device a = {0};
    ioctl(fd, RD_MY_DEVICES, &a);
    printf("lol: %" PRIu64 ";\n", a.size);
    printf("Closing a driver...\n");
    close(fd);
}