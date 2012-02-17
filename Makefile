
.PHONY: all
all: main.bin

OBJ = main.o  

TARGET = target
#TARGET = pc
include make_$(TARGET).mk

TEST := test01
#TEST = ""

# Build Unity
include print_ring/make.mk
include vendor/unity/make.mk

# OBJ from Tests
include $(TEST)/make.mk

main.bin: main.elf
	@ echo "...copying"
	$(CP) $(CPFLAGS) main.elf main.bin
	$(OD) $(ODFLAGS) main.elf > main.lst
	$(NM) -n main.elf > main.symboltable
	$(SIZE) main.elf > main.size

main.elf: $(LINKFILE) $(OBJ) 
	@ echo "..linking"
	$(LD) $(LFLAGS) -o $@ $(OBJ)

# Same data as with -Map=main.map but the file has a different syntax...
#arm-none-eabi-nm -n -S main.elf > main.map

CFLAGS  += -Isrc/
main.o: src/main.c
	@ echo ".compiling"
	$(CC)    $(CFLAGS) src/main.c
	$(CC) -S $(CFLAGS) src/main.c > main.s
	$(CC) -E $(CFLAGS) src/main.c > main.pre


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
	-rm -f test*.o error*.o
	-rm -f main.lst main.elf main.bin main.map
	-rm -f main.symboltable main.size
	-rm -f main.pre main.s

.PHONY: clean_all
clean_all: clean
	-rm -f log.*
	-rm -f *.i
	-rm -f *.map
