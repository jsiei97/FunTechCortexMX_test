CC      = arm-none-eabi-gcc
LD      = arm-none-eabi-gcc
AR      = arm-none-eabi-ar
AS      = arm-none-eabi-as
CP      = arm-none-eabi-objcopy
OD      = arm-none-eabi-objdump
NM      = arm-none-eabi-nm
SIZE    = arm-none-eabi-size

MCUFLAGS = -march=armv6t2 -mcpu=cortex-m3 -mthumb 
DEBUGFLAGS = -O0 -g
#DEBUGFLAGS = -O2

CFLAGS  = -Wall -Wextra -I./ -c -fno-common $(DEBUGFLAGS) $(MCUFLAGS) -mfix-cortex-m3-ldrd -DUNITY_OUTPUT_PRINT_RING -DUNITY_IGNORE_ARGS -DTARGET_STM32F103RB
AFLAGS  = -ahls $(MCUFLAGS) 
LINKFILE = src/stm32.ld
LFLAGS  = -T$(LINKFILE) -nostartfiles $(MCUFLAGS) -mfix-cortex-m3-ldrd -Xlinker -Map=main.map 

CPFLAGS = -Obinary
ODFLAGS = -S


OBJ += syscalls.o 
syscalls.o: src/syscalls.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

OBJ += low_level_init.o
low_level_init.o: src/low_level_init.c
	$(CC) $(CFLAGS) -o $@ $<
