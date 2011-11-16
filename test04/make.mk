#Add this dir
CFLAGS  += -Itest04/

#Include this obj
OBJ += test04.o

test04.o: test04/test04.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

