; syscall numbers
%define SYS_EXIT  60
%define SYS_WRITE 1

%define STDOUT 1
%define STDERR 2

; syscall %macros
%macro exit 1
  mov rax, SYS_EXIT
  mov rdi, %1
  syscall
%endmacro

%macro write 3
  mov rax, SYS_WRITE
  mov rdi, %1
  lea rsi, %2
  mov rdx, %3
  syscall
%endmacro


; function %macros
%macro add_two_num_fn 2
  mov rdi, %1
  mov rsi, %2
  call add_two_num
%endmacro

%macro sum_of_squares_fn 1
  mov rdi, %1
  call sum_of_squares
%endmacro

%macro safe_factorial_fn 1
  mov rdi, %1
  call safe_factorial
%endmacro

%macro two_sum_fn 3
  lea rdi, %1
  mov rsi, %2
  mov rdx, %3
  call two_sum
%endmacro

%macro longest_unique_substring_fn 1
  lea rdi, %1
  call longest_unique_substring
%endmacro

section .note.GNU-stack

section .data
two_sum_num_arr: dq 2, 7, 11, 15
two_sum_num_arr_len: dq 4
two_sum_target: dq 18
input_str1: db "abcabcdbcaa\n"
input_str1_len equ $ - input_str1
input_str2: db "hello world\n"
input_str2_len equ $ - input_str2

section .text
global _start
extern safe_factorial
extern raise_to_power
extern add_two_num
extern sum_of_squares
extern two_sum
extern longest_unique_substring

_start:
  add_two_num_fn 4, 9
  sum_of_squares_fn 3
  safe_factorial_fn 5
  two_sum_fn [two_sum_num_arr], two_sum_num_arr_len, two_sum_target

  write STDOUT, [input_str1], input_str1_len
  longest_unique_substring_fn [input_str1]

  write STDOUT, [input_str2], input_str2_len
  longest_unique_substring_fn [input_str2]

  exit 0


