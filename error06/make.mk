#Add this dir
CFLAGS  += -Ierror06/

#Include this obj
OBJ += error06.o

error06.o: error06/error06.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
