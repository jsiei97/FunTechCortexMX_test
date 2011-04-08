#include <stdio.h>
#include <stdlib.h>

/**
 * Start test ...
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int test = 1;

    int a = 0;
    int b = 0;
    int c = 0;

    a = 10;
    b = 10;
    c = a * b;

    if (c != 100) {
        return test;
    }

    return 0;
}
