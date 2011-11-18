
all: main.bin

OBJ = main.o  

TARGET = target
#TARGET = pc
include make_$(TARGET).mk

TEST := test01
#TEST = ""

# Build Unity
include print_ring/make.mk
include unity/make.mk

# OBJ from Tests
include $(TEST)/make.mk

main.bin: main.elf
	@ echo "...copying"
	$(CP) $(CPFLAGS) main.elf main.bin
	$(OD) $(ODFLAGS) main.elf > main.lst

main.elf: $(LINKFILE) $(OBJ) 
	@ echo "..linking"
	$(LD) $(LFLAGS) -o $@ $(OBJ)

CFLAGS  += -Isrc/
main.o: src/main.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) src/main.c




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
	-rm -f *.i
