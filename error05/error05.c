#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 05, infinite loop, that fills the stack
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    return start_test() + start_test();
}
