#include <stdio.h>
int main() {
    int i = 9;
    int varloc = 678;
    float var = 999;
    FILE* output = fopen("output.txt", "w");
    for (i=0; i<10000; i++)
    {
        fprintf(output, "%f\n", var/9223372036854775808.0);
    }
}