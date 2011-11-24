#This dir
DIR_UNITY = vendor/unity

#Add this dir
CFLAGS  += -I$(DIR_UNITY)/

#Include this obj
OBJ += unity.o unity_fixture.o

unity.o: $(DIR_UNITY)/unity.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

unity.i: $(DIR_UNITY)/unity.c
	@ echo ".preprocessing"
	$(CC) $(CFLAGS) -E -o $@ $<

unity_fixture.o: $(DIR_UNITY)/unity_fixture.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

unity_fixture.i: $(DIR_UNITY)/unity_fixture.c
	@ echo ".preprocessing"
	$(CC) $(CFLAGS) -E -o $@ $<

