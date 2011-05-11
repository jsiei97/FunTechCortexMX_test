#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 01, write to adress 0x0
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int* pointer = 0x0;
    *pointer = 0xBAADC0DE;
 
    return 0;
}
