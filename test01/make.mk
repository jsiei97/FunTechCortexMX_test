#Add this dir
CFLAGS  += -Itest01/

#Include this obj
OBJ += test_main.o

test_main.o: test01/test_main.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

