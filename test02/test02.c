#include <stdio.h>
#include <stdlib.h>

/**
 * Start test with foat:s
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int test = 1;

    float x = 2;
    float y = 4;
    float z = 8;

    if( (x*y) != 8 ) { 
        return test;
    }

    test++;

    if ( (y/x) != 2 ) {
        return test;
    }

    return 0;
}
