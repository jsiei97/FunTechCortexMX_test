

#include "main.h"
#include "nvic.h"



// #SP 0x20000000+0x4FFC = 20 476 ~ 20k RAM    

//Define the vector table
unsigned int * nvic_vector[4] 
__attribute__ ((section(".nvic_vector")))= {
    (unsigned int *) 0x20004FFC,       // stack pointer
    (unsigned int *) main,             // code entry point
    (unsigned int *) Default_Handler,  // NMI handler (not really)
    (unsigned int *) Default_Handler   // NMI handler (not really)
};


void Default_Handler(void)
{
    while(1);
    return;
}
                                                 
