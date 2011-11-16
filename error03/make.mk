#Add this dir
CFLAGS  += -Ierror03/

#Include this obj
OBJ += error03.o

error03.o: error03/error03.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
