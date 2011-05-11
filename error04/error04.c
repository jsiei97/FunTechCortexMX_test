#include <stdio.h>
#include <stdlib.h>

/**
 * Error test 04, Div by zero
 *
 * @return 0 is success, 1.n is failure at subpart n
 */
int start_test()
{
    int i = 3;
    int j;
    for(i = 3; i>-3; i--)
    {
        //When i becomes 0 we should have div by zero and have a error.
        j = 30/i; 

        if(i==-2)
        {
            return j;
        }
    }

    return 0;
}
