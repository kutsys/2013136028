#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

int main(char *argv[]) {
        int nread;
        FILE *in, *out;
        char block[1024];
        clock_t newtime = 0;
        clock_t oldtime = 0;
        double ElapsedTime = 0.0;

        char msg[16]= "Process in";

        in = fopen("test.zip", "rb");
        out = fopen("copied.zip", "wb");

        write(1,msg,16);

        oldtime = clock();

        while((nread = fread(block, sizeof(char), sizeof(block) , in))>0){
                fwrite(block, sizeof(char), nread, out);
                newtime = clock();
                ElapsedTime = (double)(newtime - oldtime)/CLOCKS_PER_SEC;

                if(ElapsedTime >= 0.5) {
                        oldtime = clock();
                        write(1,"*",1);
                        fflush(stdout);
                }
        }
        fclose(in);
        fclose(out);
}
