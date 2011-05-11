#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 03, Jump to adress 0xDEADBABE
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int (*fpBabe)() = 0xDEADBABE;
    fpBabe();

    return 0;
}
