#Add this dir
CFLAGS  += -Ierror05/

#Include this obj
OBJ += error05.o

error05.o: error05/error05.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
