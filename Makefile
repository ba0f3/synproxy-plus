ifneq ($(KERNELRELEASE),)
obj-m += ipt_SYNPROXYh.o
else
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all: ipt_SYNPROXYh.ko

ipt_SYNPROXYh.ko: ipt_SYNPROXYh.c
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	$(RM) -f *.so *.o
endif
