
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

#ifndef TARGET_PC
extern size_t _bss_begin;
extern size_t _bss_end;
extern size_t _end;
#endif

int main(int argc, char * argv[])
{
#ifndef TARGET_PC
    // Please note that malloc needs the bss area to be clean.
    size_t bss_begin = &_bss_begin;
    size_t bss_end   = &_bss_end;
    size_t bss_size  = bss_end - bss_begin;
    memset(&_bss_begin, 0x00, bss_size);

    size_t end   = &_end;
#endif

    reset_buffer();
    return UnityMain(argc, argv, runAllTests);

    while(1);
}

