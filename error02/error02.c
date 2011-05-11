#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 02, Write 0xDEADBEEF to adress 0xCAFEBABE
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int* pointer = 0xCAFEBABE;
    *pointer = 0xDEADBEEF;

    return 0;
}
