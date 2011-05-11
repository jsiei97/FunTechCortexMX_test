#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 06, call malloc until we run out of memory
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    while(1)
    {
        char* data = malloc(512);
        /// @todo Maybe fill the area with some nice data.
    }
    return 0;
}
