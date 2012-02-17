#include <stdint.h>

#include "main.h"

void low_level_init(void);
void Default_Handler(void);

extern unsigned int _STACKTOP;

// Define the vector table
unsigned int * the_nvic_vector[] 
__attribute__ ((section(".nvic_vector")))= {
    (unsigned int *)	&_STACKTOP,       // stack pointer
    (unsigned int *) 	low_level_init,   // code entry point
    (unsigned int *)	Default_Handler,  // NMI handler (not really)
    (unsigned int *)	Default_Handler   // hard fault handler (let's hope not)
};


void Default_Handler(void)
{
    while(1);
    return;
}


extern unsigned int _BSS_BEGIN;
extern unsigned int _BSS_END;

extern unsigned int _DATA_BEGIN;
extern unsigned int _DATA_END;
extern unsigned int _DATAI_BEGIN;
extern unsigned int _DATAI_END;

void low_level_init(void)
{
    uint32_t* bss_begin = &_BSS_BEGIN;
    uint32_t* bss_end   = &_BSS_END;
    while(bss_begin < bss_end)
    {
        *bss_begin = 0;
        bss_begin++;
    }

    uint32_t* data_begin  = &_DATA_BEGIN;
    uint32_t* data_end    = &_DATA_END;
    uint32_t* datai_begin = &_DATAI_BEGIN;
    uint32_t* datai_end   = &_DATAI_END;

    uint32_t data_size  = data_end  - data_begin;
    uint32_t datai_size = datai_end - datai_begin;

    if(data_size != datai_size) {
        //Linker script is not correct.
        while(1);
    }

    while(data_begin < data_end)
    {
        *data_begin = *datai_begin;
        data_begin++;
        datai_begin++;
    }


    main(0,0);
}


