#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 10

/**
 * Start test to see that malloc and free is working.
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int test = 1;

    //First use malloc 3 times
    char* str1 = malloc(SIZE);
    if(str1 == NULL)
    {
        return test;
    }
    test++;

    char* str2 = malloc(SIZE);
    if(str2 == NULL)
    {
        return test;
    }
    test++;

    char* str3 = malloc(SIZE);
    if(str3 == NULL)
    {
        return test;
    }
    test++;

    //Check so the pointer adress is not the same
    if( &str1 == &str2 || &str2 == &str3)
    {
        return test;
    }
    test++;

    //Fill the areas with some data that is easy to spot in a hexeditor.
    memset(str1, 0x55, SIZE);
    memset(str2, 0x66, SIZE);
    memset(str3, 0x77, SIZE);

    //abort();

    //Cleanup
    free(str1);
    free(str2);
    free(str3);
 
    return 0;
}
