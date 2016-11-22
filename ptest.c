#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

int main() {
  int n = 0;
  time_t first;
  time(&first);
  while(1) {
    printf("time in system : %ld\n", first);
    sleep(2);
    time(&first);
  }
  return 0;
}
