#include "types.h"

#ifndef FUNCTIONS_H
#define FUNCTIONS_H

void printchar(char ch, uint8 color){
  string vidmem = (string)0xb8000;
  vidmem[0] = ch;
  vidmem[1] = color;
  
}

#endif
