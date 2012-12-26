#include <stdio.h>

int main(void) {
  int var, another = 20;
  float fl = 10.001, fb = 20.002;

  printf("Enter a number");
  scanf("%i", &var);

  int r1, r2;
  float f1, f2;

  r1 = var + another;
  r2 = var + fl;

  f1 = fl + fb;
  f2 = var + fb;

  printf("result int = int + int => %i\n", r1);
  printf("result int = int + float => %i\n", r2);

  printf("result float = float + float => %f\n", f1);
  printf("result float = int + float => %f\n", f2);
}
