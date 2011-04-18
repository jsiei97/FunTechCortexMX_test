#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Start test to see that sprintf is working.
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int test = 1;
    int arr_size=10;
    char str[arr_size];

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
    //sprintf(str, "4321");
    sprintf(str, "%d", 4321);

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

    //Check strlen so "4321" is 4 chars!
    int size = strlen(str);
    if(size != 4)
    {
        return test;
    }
    test++;


    //And check that snprintf is working as well
    snprintf(str, arr_size, "5678");

    if(str[0] != '5')
    {
        return test;
    }
    test++;

    if(str[1] != '6')
    {
        return test;
    }
    test++;
 
    return 0;
}
