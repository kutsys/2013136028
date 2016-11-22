#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/time.h>

void LowCopy() {
        char buff_size[1024];
        int in, out;
        int nread;

        in = open("test.txt", O_RDONLY);
        out = open("result.txt", O_WRONLY|O_CREAT, S_IRUSR|S_IWUSR);
        printf("start \n");

        while((nread = read(in, buff_size, sizeof(buff_size)))>0) {
                printf(".");
                write(out, buff_size, nread);
                sleep(1);
        }
        printf("\nfinish\n");
}
int main()
{
        LowCopy();
        return 0;
}
