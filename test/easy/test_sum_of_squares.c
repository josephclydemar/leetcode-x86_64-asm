#include "criterion/criterion.h"
#include <stdint.h>

extern int64_t sum_of_squares(int64_t n);

Test(easy, sum_of_squares) {
  cr_expect(sum_of_squares(-3) == 0);
  cr_expect(sum_of_squares(-2) == 0);
  cr_expect(sum_of_squares(-1) == 0);
  cr_expect(sum_of_squares(0) == 0);
  cr_expect(sum_of_squares(1) == 1);
  cr_expect(sum_of_squares(2) == 5);
  cr_expect(sum_of_squares(3) == 14);
}

