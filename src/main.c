
#include "main.h"
#include "test_main.h"
#include "unity_fixture.h"
#include "print_ring.h"

#ifdef DEBUG_QUIT
#include "stdio.h"
#include "stdlib.h"
#endif

void test_failed() {

#ifdef DEBUG_QUIT
    printf("Test failed\n");
    exit(1);
#endif

    while(1);
}

void test_success() {

#ifdef DEBUG_QUIT
    printf("Test ok\n");
    exit(0);
#endif

    while(1);
}




int main(int argc, char * argv[])
{
    reset_buffer();
    return UnityMain(argc, argv, runAllTests);

    while(1);
}

