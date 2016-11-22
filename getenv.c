#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  printf("%s\n", getenv("HOME"));
  printf("%s\n", getenv("PS1"));
  printf("%s\n", getenv("PATH"));
  printf("$%s\n", getenv("LD_LIBRARY_PATH"));
}  
