#Add this dir
CFLAGS  += -Itest03/

#Include this obj
OBJ += test03.o

test03.o: test03/test03.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

