#Add this dir
CFLAGS  += -Itest02/

#Include this obj
OBJ += test_main.o

test_main.o: test02/test_main.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

