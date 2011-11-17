#Add this dir
CFLAGS  += -Iunity/

#Include this obj
OBJ += unity.o unity_fixture.o

unity.o: unity/unity.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

unity_fixture.o: unity/unity_fixture.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<


