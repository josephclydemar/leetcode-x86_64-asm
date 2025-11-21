%define SYS_WRITE   0x3c

section .note.GNU-stack

;section .data
;input_str1: db "abcabcdbcaa", 0x0
;input_str2: db "hello world", 0x0

section .text
global _start
extern safe_factorial
extern raise_to_power
extern add_two_num
extern sum_of_squares
;extern longest_unique_substring

_start:
  mov rdi, 0x4
  mov rsi, 0x9
  call add_two_num

  mov rdi, 0x3
  call sum_of_squares

  mov rdi, 0x5
  call safe_factorial

  ;mov rdi, input_str1
  ;call longest_unique_substring

  ;mov rdi, input_str2
  ;call longest_unique_substring

  mov rax, SYS_WRITE
  mov rdi, 0x0
  syscall

