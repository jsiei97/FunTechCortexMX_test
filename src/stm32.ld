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
    } >rom

    .data_init_begin : 
    {
        _DATAI_BEGIN = .;
    } >rom

    .data : 
    {
        _DATA_BEGIN = .;
        *(.data)      /* Data memory */
        *(.data.*)        
        _DATA_END = .;
    } >ram AT >rom

    .data_init_end : 
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
