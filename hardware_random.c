#include <stdio.h>
int main() {
    int i = 9;
    int var = 999;
    FILE* output = fopen("output.txt", "w");
    for (i=0; i<10000; i++)
    {
        fprintf(output, "%d\n", var);
    }
}