#Add this dir
CFLAGS  += -Iunity/

#Include this obj
OBJ += unity.o unity_fixture.o

unity.o: unity/unity.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

unity.i: unity/unity.c
	@ echo ".preprocessing"
	$(CC) $(CFLAGS) -E -o $@ $<

unity_fixture.o: unity/unity_fixture.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

unity_fixture.i: unity/unity_fixture.c
	@ echo ".preprocessing"
	$(CC) $(CFLAGS) -E -o $@ $<

