#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Start test to see that sscanf is working.
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int test = 1;

    char sentence []="Value 0x12";
    char str [20];
    int value;

    sscanf (sentence,"%s %x",str ,&value);
    //printf ("%s -> 0x%x %d\n",str,i,i);

    if(value != 0x12)
    {
        return test;
    }
    test++;
 
    return 0;
}
