CC      = gcc
LD      = gcc 
AR      = ar
AS      = as
CP      = objcopy
OD      = objdump

MCUFLAGS = 
DEBUGFLAGS = -O0 -g
#DEBUGFLAGS = -O2

CFLAGS  = -Wall -Wextra -I./ -c $(DEBUGFLAGS) $(MCUFLAGS) -DDEBUG_QUIT 
#-DUNITY_OUTPUT_PRINT_RING
AFLAGS  = -ahls $(MCUFLAGS) 
LFLAGS  = $(MCUFLAGS) 

CPFLAGS = -Obinary
ODFLAGS = -S

