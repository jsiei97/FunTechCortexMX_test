#Add this dir
CFLAGS  += -Itest05/

#Include this obj
OBJ += test_main.o

test_main.o: test05/test_main.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

