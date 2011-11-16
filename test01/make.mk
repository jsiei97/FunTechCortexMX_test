#Add this dir
CFLAGS  += -Itest01/

#Include this obj
OBJ += test01.o

test01.o: test01/test01.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

