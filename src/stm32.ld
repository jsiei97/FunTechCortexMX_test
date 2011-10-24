
/* Include memory info for the STM32F103RBT6 chip */
INCLUDE src/STM32F103RB.memory

SECTIONS
{
    .  = 0x0;           /* From 0x00000000 */
    .text : 
    {
        *(.nvic_vector) /* Vector table */
        *(.text.*)      /* Program code */
        *(.text)        /* Program code */
        *(.rodata)      /* Read only data */
    } >rom

    .  = 0x20000000;    /* From 0x20000000 */      
    .data : 
    {
        *(.data)        /* Data memory */
    } >ram AT > rom

    .bss : 
    {
        *(.bss)         /* Zero-filled run time allocate data memory */
    } >ram AT > rom

	_end = .;
	PROVIDE (end = .);

    .stack (NOLOAD) :
	{
		/* Have stack in a section of is own. This becomes system root stack */
		/* Having above _end makes sure Newlib heap doesn't smash it */
		/* Do not PROVIDE symbols belo. Force code to define symbols */
		_stack_start = . ;
		*(stack)
	} >RSTACK
	. = ALIGN(4);

	_stack_end = . ;
}  
