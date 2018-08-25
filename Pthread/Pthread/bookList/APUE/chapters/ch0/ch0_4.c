#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// getpid() in unistd.h 

int main (void)
{ 
  printf("hello world from proccess ID %ld \n",(long) getpid());
  exit(0);
}

