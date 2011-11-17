#Add this dir
CFLAGS  += -Itest03/

#Include this obj
OBJ += test_main.o

test_main.o: test03/test_main.c 
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

