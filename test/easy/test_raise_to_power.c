#include "criterion/criterion.h"
#include <stdint.h>

extern int64_t raise_to_power(int64_t n, int64_t p);

Test(easy, raise_to_power) {
  cr_expect(raise_to_power(0, 5) == 0);
  cr_expect(raise_to_power(1, 6) == 1);
  cr_expect(raise_to_power(2, 7) == 128);
  cr_expect(raise_to_power(3, 3) == 27);
  cr_expect(raise_to_power(4, 5) == 1024);
}

