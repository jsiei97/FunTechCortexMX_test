
all: main.bin

OBJ = main.o  

TARGET = pc
include make_$(TARGET).mk

TEST := test01
#TEST = ""

include $(TEST)/make.mk

main.bin: main.elf
	@ echo "...copying"
	$(CP) $(CPFLAGS) main.elf main.bin
	$(OD) $(ODFLAGS) main.elf > main.lst

main.elf: $(LINKFILE) $(OBJ) 
	@ echo "..linking"
	$(LD) $(LFLAGS) -o $@ $(OBJ)


# 
# OBJ
#
main.o: src/main.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) src/main.c


#startup_stm32f10x.o: src/startup_stm32f10x.s
#	@ echo ".assembling"
#	$(AS) $(AFLAGS) -o startup_stm32f10x.o src/startup_stm32f10x.s > startup_stm32f10x.lst


#
# OBJ from Tests
#

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
	-rm -f $(OBJ)
	-rm -f nvic.* test*.o error*.o
	-rm -f main.lst main.elf main.bin 

.PHONY: clean_all
clean_all: clean
	-rm -f log.*
