#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 07, Free memory two times
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    char *ptr = malloc(128);
    free(ptr); 
    free(ptr);

    return 0;
}
