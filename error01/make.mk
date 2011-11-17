#Add this dir
CFLAGS  += -Ierror01/

#Include this obj
OBJ += error01.o

error01.o: error01/error01.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<