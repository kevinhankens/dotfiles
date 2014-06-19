#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct List
{
  int i;
  struct List *next;
} List;

int main(void) {

  int max = 10000000;
  int i;
  List *start = malloc(sizeof(List));
  List *temp = malloc(sizeof(List));

  for (i=0; i < max; i++) {
    List *l = malloc(sizeof(List));
    l->i = i + 100;
    l->next = NULL;
    if (i == 0) {
      start = l;
      temp = l;
    }
    else {
      temp->next = l;
      temp = l;
    }
  }

  temp = start;
  printf("p - %p\n", temp->next);

  // Test the 1.5 method.
  clock_t timer_start = clock();

  int count = 0;
  while (temp->next != NULL) {
    temp = temp->next;
    count++;
  }

  int med = count/2;
  temp = start;
  while (count > med) {
    temp = temp->next;
    count--;
  }

  clock_t timer_end = clock();
  double elapsed_time = (timer_end-timer_start)/(double)CLOCKS_PER_SEC;
  printf("time - %f\n", elapsed_time);
  printf("med - %d %d\n", count, temp->i);

  // Test the trailer method.
  clock_t timer_start1 = clock();
  List *trailer = malloc(sizeof(List));
  temp = start;
  trailer = start;
  count = 0;
  while (temp->next != NULL) {
    if (count % 2 == 0) {
      trailer = trailer->next;
    }
    temp = temp->next;
    count++;
  }

  clock_t timer_end1 = clock();
  double elapsed_time1 = (timer_end1-timer_start1)/(double)CLOCKS_PER_SEC;
  printf("time - %f\n", elapsed_time1);
  printf("med - %d %d\n", count, trailer->i);
}
