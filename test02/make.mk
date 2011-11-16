#Add this dir
CFLAGS  += -Itest02/

#Include this obj
OBJ += test02.o

test02.o: test02/test02.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

