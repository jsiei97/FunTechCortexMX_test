#Add this dir
CFLAGS  += -Iprint_ring/

#Include this obj
OBJ += print_ring.o

print_ring.o: print_ring/print_ring.c
	@ echo ".compiling"
	$(CC) $(CFLAGS) -o $@ $<

#LOGG := print_logg.txt
#
#
#run_prog: printring
	#./$(NAME)
#
##getlog: run_prog
#getlog: 
	#perl print_ring/getLogg.pl ./$(NAME) core $(LOGG)
#
#viewlogg: getlog
	#more $(LOGG)
#
#
#.PHONY: clean
#clean:
	#$(RM) $(NAME)
	#$(RM) $(LOGG)
	#$(RM) core 
#
#
