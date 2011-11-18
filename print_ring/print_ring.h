#ifndef  __PRINTRING_H__
#define  __PRINTRING_H__

#define  PRINT_MAX_CHARS 512 

void reset_buffer();
void insertChar(char c);
int UNITY_OUTPUT_CHAR(int character);
void print_ring_print(char* data);


#endif  /*__PRINTRING_H__*/
