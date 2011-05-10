CC      = arm-none-eabi-gcc
LD      = arm-none-eabi-gcc 
AR      = arm-none-eabi-ar
AS      = arm-none-eabi-as
CP      = arm-none-eabi-objcopy
OD      = arm-none-eabi-objdump

MCUFLAGS = -mcpu=cortex-m3 -mthumb 

CFLAGS  =  -I./ -c -fno-common -O0 -g $(MCUFLAGS) -mfix-cortex-m3-ldrd
AFLAGS  = -ahls $(MCUFLAGS) 
LFLAGS  = -Tsrc/stm32.ld -nostartfiles $(MCUFLAGS) -mfix-cortex-m3-ldrd

CPFLAGS = -Obinary
ODFLAGS = -S

all: test


#TEST := test01
TEST = ""

test: main.elf
	@ echo "...copying"
	$(CP) $(CPFLAGS) main.elf main.bin
	$(OD) $(ODFLAGS) main.elf > main.lst

main.elf: src/stm32.ld main.o startup_stm32f10x.o $(TEST).o
	@ echo "..linking"
	$(LD) $(LFLAGS) -o main.elf main.o startup_stm32f10x.o $(TEST).o


# 
# OBJ
#
main.o: src/main.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) src/main.c

startup_stm32f10x.o: src/startup_stm32f10x.s
	@ echo ".assembling"
	$(AS) $(AFLAGS) -o startup_stm32f10x.o src/startup_stm32f10x.s > startup_stm32f10x.lst


#
# OBJ from Tests
#
test01.o: test01/test01.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o test01.o test01/test01.c

test02.o: test02/test02.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o test02.o $<

test03.o: test03/test03.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o test03.o $<

test04.o: test04/test04.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o test04.o $<



.PHONY: flash
flash: all
	scripts/do_flash.pl main.bin

.PHONY: clean 
clean:
	-rm -f main.o startup_stm32f10x.o test*.o 
	-rm -f main.lst main.elf main.bin startup_stm32f10x.lst 

.PHONY: clean_all
clean_all: clean
	-rm -f log.*
