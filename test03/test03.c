#include <stdio.h>
#include <stdlib.h>

/**
 * Start test to see that sprintf is working.
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int test = 1;
    char str[10];

    //First add something and check it.
    sprintf(str, "1234");

    if(str[0] != '1')
    {
        return test;
    }
    test++;

    if(str[1] != '2')
    {
        return test;
    }
    test++;



    //First add something else and check it.
    sprintf(str, "4321");

    if(str[0] != '4')
    {
        return test;
    }
    test++;

    if(str[1] != '3')
    {
        return test;
    }
    test++;




    return 0;
}
