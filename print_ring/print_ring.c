#include  <stdio.h>
#include  <stdlib.h>
#include  <string.h>


#include  "print_ring.h"


char print_ring[PRINT_MAX_CHARS];

/// Current pos in the buffer
volatile int print_ring_pos = 0;



/**
 * Reset or init the printbuffer so it is ready to be used.
 */
void reset_buffer()
{
    print_ring_pos = 0;
    memset(print_ring, 0x0, PRINT_MAX_CHARS);
}

void insertChar(char c)
{
    if(print_ring_pos >= (PRINT_MAX_CHARS))
    {
        print_ring_pos = 0;
    }
    print_ring[print_ring_pos] = c;
    print_ring_pos++;

}

int UNITY_OUTPUT_CHAR(int character)
{
    insertChar((char)character);
    return 0;
}

void print_ring_print(char* data)
{
    unsigned int i = 0;
    for(i=0; i<strlen(data);i++)
    {
        //printf("%c", test[i]);
        insertChar(data[i]);
    }
    insertChar('\0');

}


