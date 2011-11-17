#Add this dir
CFLAGS  += -Ierror04/

#Include this obj
OBJ += error04.o

error04.o: error04/error04.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<
