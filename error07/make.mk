#Add this dir
CFLAGS  += -Ierror07/

#Include this obj
OBJ += error07.o

error07.o: error07/error07.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
