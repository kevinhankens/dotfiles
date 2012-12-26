#include <stdio.h>
#include <stdbool.h>

int main(void) {

  bool ask = true;
  int total = 0, number, multiple = 10, temp, remainder, count = 0, ii;

  int results[10];

  while (ask) {

    printf("What's your number (0 to quit)?");
    scanf("%i", &number);

    if (number != 0) {

      do {
printf("NUM: %i\n", number);
        if (number/multiple != 0) {
          temp = number % multiple;
          number = number/multiple;
        }
        else {
          temp = number;
          number = 0;
        }

        count++;
        results[count] = temp;

      }
      while (number > 0);

      for (ii = count; ii > 0; ii--) {
        switch (results[ii]) {
          case 0:
            printf("zero ");
            break;
          case 1:
            printf("one ");
            break;
          case 2:
            printf("two ");
            break;
          case 3:
            printf("three ");
            break;
          case 4:
            printf("four ");
            break;
          case 5:
            printf("five ");
            break;
          case 6:
            printf("six ");
            break;
          case 7:
            printf("seven ");
            break;
          case 8:
            printf("eight ");
            break;
          case 9:
            printf("nine ");
            break;
        }

      }

      printf("\n");
      printf("\n");

    }
    else {
      ask = false;
      printf("Thanks!\n");
    }

  }

  return 0;
}
