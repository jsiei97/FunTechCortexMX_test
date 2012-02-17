/* Include memory info for the STM32F103RBT6 chip */
INCLUDE src/STM32F103RB.memory

SECTIONS
{
    .nvic_vector : 
    {
        *(vectors)    /* Vector table */
    } >rom

    .text : 
    {
        *(.text)      /* Program code */
        *(.text.*)
        *(.rodata)    /* Read only data */
        *(.rodata.*)        

        . = ALIGN(4);
        _DATAI_BEGIN = .;
    } >rom

    .data : 
    {
        . = ALIGN(4);
        _DATA_BEGIN = .;
        *(.data)      /* Data memory */
        *(.data.*)        
        _DATA_END = .;
    } >ram AT >rom

    .data_init : 
    {
        _DATAI_END = .;
    } >rom

    .bss :
    {
        _BSS_BEGIN = .;
        *(.bss)       /* Zero-filled run time allocate data memory */
        *(.bss.*)
        *(COMMON)        
        _BSS_END = .;
    } >ram 

    .heap :
    {
        _HEAP = .;
    } >ram

    .stack :
    {
        _STACKTOP = .;
    } >stack

}  
