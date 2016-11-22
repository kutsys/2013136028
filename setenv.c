#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  setenv("TEST_ENV", "1234", 0);
  printf("TEST_ENV : %s\n", getenv("TEST_ENV"));
}
