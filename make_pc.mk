CC      = gcc
LD      = ld
AR      = ar
AS      = as
CP      = objcopy
OD      = objdump

MCUFLAGS = 
DEBUGFLAGS = -O0 -g
#DEBUGFLAGS = -O2

CFLAGS  = -Wall -Wextra -I./ -c $(DEBUGFLAGS) $(MCUFLAGS) -DDEBUG_QUIT -DTARGET_PC
AFLAGS  = -ahls $(MCUFLAGS) 
LFLAGS  = $(MCUFLAGS) 

CPFLAGS = -Obinary
ODFLAGS = -S

