#include "criterion/criterion.h"
#include <stdint.h>

extern int64_t add_two_num(int64_t a, int64_t b);

Test(hello, add_two_num) {
  cr_expect(add_two_num(0, 5) == 5);
  cr_expect(add_two_num(1, 6) == 7);
  cr_expect(add_two_num(2, 7) == 9);
  cr_expect(add_two_num(3, 8) == 11);
  cr_expect(add_two_num(4, 9) == 13);
}

