#include "criterion/criterion.h"
#include <stdint.h>

extern int64_t safe_factorial(int64_t n);

/**
 * (n >= 0 || n <= 20) -> n! : 0
 */
Test(leetcode_x86_64_asm, safe_factorial) {
  cr_expect(safe_factorial(-5) == 0);
  cr_expect(safe_factorial(-1) == 0);
  cr_expect(safe_factorial(0) == 1);
  cr_expect(safe_factorial(1) == 1);
  cr_expect(safe_factorial(2) == 2);
  cr_expect(safe_factorial(3) == 6);
  cr_expect(safe_factorial(5) == 120);
  cr_expect(safe_factorial(10) == 3628800);
  cr_expect(safe_factorial(20) == 2432902008176640000);
  cr_expect(safe_factorial(21) == 0);
  cr_expect(safe_factorial(30) == 0);
}

