
LDSCRIPT   = ../libopencm3/lib/stm32/l1/stm32l100xc.ld
LIBNAME    = opencm3_stm32l1
ARCH_FLAGS = -mthumb -mcpu=cortex-m3 -msoft-float
DEFINES    = -DSTM32L1
OBJS	   = stm32l1_wrapper.o

all: lib aes.bin
include ../common/make.mk

# exceptional case, since it uses an extra dependency (i.e. asmfunction.s)
aes.elf: aes.o aes.s $(OBJS) $(LDSCRIPT)
	$(LD) -o aes.elf aes.o aes.s $(OBJS) $(LDFLAGS) -l$(LIBNAME)
