#include <stdio.h>

int j, k;
int *ptr;

int test(int);

int main(void)
{
    printf("int: %i", test(1));
    printf("int: %i", test(3));
    printf("int: %i", test(6));

    j = 1;
    k = 2;
    ptr = &k;
    printf("\n");
    printf("j has the value %d and is stored at %p\n", j, (void *)&j);
    printf("k has the value %d and is stored at %p\n", k, (void *)&k);
    printf("ptr has the value %p and is stored at %p\n", ptr, (void *)&ptr);
    printf("The value of the integer pointed to by ptr is %d\n", *ptr);

    return 0;
}

int test(int x) {

  return x+10;
}
