obj-m += tmodule.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

create-dev:
	sudo mknod /dev/kvadra_t c 22 0

load:
	sudo insmod tmodule.ko

unload:
	sudo rmmod tmodule

update:
	make all
	make unload
	make load

create-client:
	gcc client.c -o client