#ifndef  __PRINTRING_H__
#define  __PRINTRING_H__

#define  PRINT_MAX_CHARS 512 

//#define  USE_MALLOC
//#define  USE_PRINTF
//
//#ifdef USE_MALLOC
//#define buf_printf(X, Y...) do{ int len = printf(X, ## Y); \
    //char* data = malloc((len+1)*sizeof(char)); \
    //sprintf(data, X, ## Y); \
    //my_print(data);\
    //free(data);}while(0)
//#else 
//
//#ifdef USE_PRINTF
//#define buf_printf(X, Y...) do{ printf(X, ## Y); \
    //char data[20]; \
    //snprintf(data,20, X, ## Y); \
    //my_print(data);}while(0)
//#else 
//#define buf_printf(X, Y...) do{ \
    //char data[20]; \
    //snprintf(data,20, X, ## Y); \
    //my_print(data);}while(0)
//#endif
//#endif
//
//
//#define buf2_printf(X, Y...) do{ int len = printf(X, ## Y); \
    //char* data = alloca((len+1)*sizeof(char)); \
    //sprintf(data, X, ## Y); \
    //my_print(data);}while(0)
//


void insertChar(char c);
void print_ring_print(char* data);


#endif  /*__PRINTRING_H__*/
