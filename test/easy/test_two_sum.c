#include "criterion/criterion.h"
#include <stdint.h>

#define TEST_INPUT1_SIZE     4
#define TEST_INPUT2_SIZE     3
#define TEST_INPUT3_SIZE     2
#define TEST_INPUT4_SIZE     5
#define TEST_INPUT5_SIZE     9
#define TEST_INPUT6_SIZE     4

struct two_sum_ret {
  uint64_t idx1;
  uint64_t idx2;
};

extern struct two_sum_ret two_sum(int64_t* nums_arr, uint64_t arr_size, int64_t target);

Test(easy, two_sum) {
  int64_t test_input1[TEST_INPUT1_SIZE] = { 2, 7, 11, 15 };
  int64_t test_input2[TEST_INPUT2_SIZE] = { 3, 2, 4 };
  int64_t test_input3[TEST_INPUT3_SIZE] = { 3, 3 };
  int64_t test_input4[TEST_INPUT4_SIZE] = { 2, -7, 11, 5, -3 };
  int64_t test_input5[TEST_INPUT5_SIZE] = { -2, 7, 15, -5, 0, 1, 9, 24, 7 };
  int64_t test_input6[TEST_INPUT6_SIZE] = { -5, 3, 4, 2 };

  struct two_sum_ret test_ret1 = two_sum(test_input1, TEST_INPUT1_SIZE, 18);
  struct two_sum_ret test_ret2 = two_sum(test_input2, TEST_INPUT2_SIZE, 5);
  struct two_sum_ret test_ret3 = two_sum(test_input3, TEST_INPUT3_SIZE, 6);
  struct two_sum_ret test_ret4 = two_sum(test_input4, TEST_INPUT4_SIZE, -2);
  struct two_sum_ret test_ret5 = two_sum(test_input5, TEST_INPUT5_SIZE, 4);
  struct two_sum_ret test_ret6 = two_sum(test_input6, TEST_INPUT6_SIZE, 7);

  cr_expect(test_ret1.idx1 == 1 && test_ret1.idx2 == 2);
  cr_expect(test_ret2.idx1 == 0 && test_ret2.idx2 == 1);
  cr_expect(test_ret3.idx1 == 0 && test_ret3.idx2 == 1);
  cr_expect(test_ret4.idx1 == 1 && test_ret4.idx2 == 3);
  cr_expect(test_ret5.idx1 == 3 && test_ret5.idx2 == 6);
  cr_expect(test_ret6.idx1 == 1 && test_ret6.idx2 == 2);
}

