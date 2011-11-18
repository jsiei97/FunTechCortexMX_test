#Add this dir
CFLAGS  += -Iprint_ring/

#Include this obj
OBJ += print_ring.o

print_ring.o: print_ring/print_ring.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

