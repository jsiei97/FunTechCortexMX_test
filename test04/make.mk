#Add this dir
CFLAGS  += -Itest04/

#Include this obj
OBJ += test_main.o

test_main.o: test04/test_main.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

