#Add this dir
CFLAGS  += -Ierror02/

#Include this obj
OBJ += error02.o

error02.o: error02/error02.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
