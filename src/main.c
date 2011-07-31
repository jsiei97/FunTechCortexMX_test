
#include "main.h"

#ifdef DEBUG_QUIT
#include "stdio.h"
#include "stdlib.h"
#endif

void test_failed(int number) {

#ifdef DEBUG_QUIT
    printf("Test failed nr=%d\n",number);
    exit(1);
#endif

    while(1);
}

void test_success(int number) {

#ifdef DEBUG_QUIT
    printf("Test ok\n");
    exit(0);
#endif

    while(1);
}

int main(void) {
    int status = start_test();

    if( status > 0 ) {
        test_failed(status);
    }
    test_success(0);

    while(1);
}
