#include "criterion/criterion.h"
#include <stdint.h>

extern uint64_t longest_unique_substring(char* str);

Test(medium, longest_unique_substring) {
  cr_expect(longest_unique_substring("abcabcbb") == 3);
  cr_expect(longest_unique_substring("abcdef") == 6);
  cr_expect(longest_unique_substring("aaaaaa") == 1);
  cr_expect(longest_unique_substring("z") == 1);
  cr_expect(longest_unique_substring("") == 0);
  cr_expect(longest_unique_substring("abba") == 2);
  cr_expect(longest_unique_substring("pwwkew") == 3);
  cr_expect(longest_unique_substring("abcdeafgh") == 8);
  cr_expect(longest_unique_substring("a1b1c1d1") == 2);
  cr_expect(longest_unique_substring("dvdf") == 3);
}

