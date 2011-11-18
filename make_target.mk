CC      = arm-none-eabi-gcc
LD      = arm-none-eabi-gcc 
AR      = arm-none-eabi-ar
AS      = arm-none-eabi-as
CP      = arm-none-eabi-objcopy
OD      = arm-none-eabi-objdump

MCUFLAGS = -mcpu=cortex-m3 -mthumb 
DEBUGFLAGS = -O0 -g
#DEBUGFLAGS = -O2

CFLAGS  = -Wall -Wextra -I./ -c -fno-common $(DEBUGFLAGS) $(MCUFLAGS) -mfix-cortex-m3-ldrd -DUNITY_OUTPUT_PRINT_RING -DUNITY_IGNORE_ARGS 
AFLAGS  = -ahls $(MCUFLAGS) 
LINKFILE = src/stm32.ld
LFLAGS  = -T$(LINKFILE) -nostartfiles $(MCUFLAGS) -mfix-cortex-m3-ldrd

CPFLAGS = -Obinary
ODFLAGS = -S

OBJ += nvic.o 
nvic.o: src/nvic.c src/main.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
	$(OD) $(ODFLAGS) $@ > nvic.lst

#startup_stm32f10x.o: src/startup_stm32f10x.s
#	@ echo ".assembling"
#	$(AS) $(AFLAGS) -o startup_stm32f10x.o src/startup_stm32f10x.s > startup_stm32f10x.lst
