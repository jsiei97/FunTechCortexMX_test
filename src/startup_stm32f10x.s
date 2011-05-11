    .syntax unified
    .cpu cortex-m3
    .fpu softvfp
    .thumb

    .global  Default_Handler
    .global  g_pfnVectors
    .global  .isr_vector


    .section  .text.Default_Handler,"ax",%progbits 
Default_Handler: 
Infinite_Loop: 
    nop
    b  Infinite_Loop 
    .size  Default_Handler, .-Default_Handler 


    .section  .isr_vector,"a",%progbits
    .type  g_pfnVectors, %object
    .size  g_pfnVectors, .-g_pfnVectors
    
#SP 0x20000000+0x4FFC = 20 476 ~ 20k RAM    
g_pfnVectors:
  .word  0x20004FFC 
  .word  main 
  .word  Default_Handler
  .word  Default_Handler
   
