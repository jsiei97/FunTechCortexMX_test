CC      = arm-none-eabi-gcc
LD      = arm-none-eabi-gcc 
AR      = arm-none-eabi-ar
AS      = arm-none-eabi-as
CP      = arm-none-eabi-objcopy
OD      = arm-none-eabi-objdump

MCUFLAGS = -mcpu=cortex-m3 -mthumb 
DEBUGFLAGS = -O0 -g
#DEBUGFLAGS = -O2

CFLAGS  = -I./ -c -fno-common $(DEBUGFLAGS) $(MCUFLAGS) -mfix-cortex-m3-ldrd
AFLAGS  = -ahls $(MCUFLAGS) 
LFLAGS  = -Tsrc/stm32.ld -nostartfiles $(MCUFLAGS) -mfix-cortex-m3-ldrd

CPFLAGS = -Obinary
ODFLAGS = -S

all: main.bin


#TEST := test01
TEST = ""

main.bin: main.elf
	@ echo "...copying"
	$(CP) $(CPFLAGS) main.elf main.bin
	$(OD) $(ODFLAGS) main.elf > main.lst

main.elf: src/stm32.ld main.o nvic.o $(TEST).o
	@ echo "..linking"
	$(LD) $(LFLAGS) -o $@ main.o nvic.o $(TEST).o


pc: main.o $(TEST).o
	@ echo "..linking"
	$(LD) -o main.elf main.o $(TEST).o

# 
# OBJ
#
main.o: src/main.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) src/main.c

nvic.o: src/nvic.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
	$(OD) $(ODFLAGS) $@ > nvic.lst

#startup_stm32f10x.o: src/startup_stm32f10x.s
#	@ echo ".assembling"
#	$(AS) $(AFLAGS) -o startup_stm32f10x.o src/startup_stm32f10x.s > startup_stm32f10x.lst


#
# OBJ from Tests
#
test01.o: test01/test01.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

test02.o: test02/test02.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

test03.o: test03/test03.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

test04.o: test04/test04.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

test05.o: test05/test05.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<


#
# OBJ from Error tests, to play with error handling
#
error01.o: error01/error01.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

error02.o: error02/error02.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

error03.o: error03/error03.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

error04.o: error04/error04.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

error05.o: error05/error05.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

error06.o: error06/error06.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

error07.o: error07/error07.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<



.PHONY: flash
flash: all
	scripts/start_server.bsh
	scripts/do_flash.pl main.bin

.PHONY: ddd
ddd: flash 
	ddd --eval-command="target remote localhost:3333" --debugger arm-none-eabi-gdb  main.elf


.PHONY: clean 
clean:
	-rm -f main.o nvic.* test*.o error*.o
	-rm -f main.lst main.elf main.bin 

.PHONY: clean_all
clean_all: clean
	-rm -f log.*
