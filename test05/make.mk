#Add this dir
CFLAGS  += -Itest05/

#Include this obj
OBJ += test05.o

test05.o: test05/test05.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

