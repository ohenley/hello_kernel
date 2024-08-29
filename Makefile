GNATMAKE = gnatmake
RTS_PATH = ./rts-native-light
SRC_DIR = ./src
KERNEL_VERSION = $(shell uname -r)
KERNEL_HEADERS_DIR = /usr/src/linux-headers-$(KERNEL_VERSION)/include
ARCH_HEADERS_DIR = /usr/src/linux-headers-$(KERNEL_VERSION)/arch/x86/include
GENERATED_HEADERS_DIR = /usr/src/linux-headers-$(KERNEL_VERSION)/arch/x86/include/generated

all: build_runtime module.ko

build_runtime:
	$(GNATMAKE) -P $(RTS_PATH)/runtime_build.gpr

module.o: $(SRC_DIR)/module.adb
	$(GNATMAKE) -c $(SRC_DIR)/module.adb --RTS=$(RTS_PATH) -aO.

kernel.o: $(SRC_DIR)/kernel.adb
	$(GNATMAKE) -c $(SRC_DIR)/kernel.adb --RTS=$(RTS_PATH) -aO.

main.o: $(SRC_DIR)/main.c
	$(CC) -c $(SRC_DIR)/main.c -o main.o -I$(KERNEL_HEADERS_DIR) -I$(ARCH_HEADERS_DIR) -I$(GENERATED_HEADERS_DIR) -I$(KERNEL_HEADERS_DIR)/uapi

module.ko: module.o kernel.o main.o
	$(MAKE) -C /lib/modules/$(KERNEL_VERSION)/build M=$(PWD) modules

clean:
	gnatclean $(SRC_DIR)/module.adb $(SRC_DIR)/kernel.adb
	rm -f *.o *.ali *.ko *.mod.c .*.cmd *.symvers *.order

.PHONY: all clean
