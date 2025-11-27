.intel_syntax noprefix

# system calls
.equ SYS_EXIT, 60
.equ SYS_WRITE, 1

.equ STDOUT, 1
.equ STDERR, 2

.macro exit error_code
  mov rax, SYS_EXIT
  mov rdi, \error_code
  syscall
.endm

.macro write fd, buf_addr, buf_len
  mov rax, SYS_WRITE
  mov rdi, \fd
  lea rsi, \buf_addr
  mov rdx, \buf_len
  syscall
.endm

.section .note.GNU-stack

.section .data
two_sum_num_arr: .quad 2, 7, 11, 15
two_sum_num_arr_size: .quad 4
two_sum_target: .quad 18
input_str1: .ascii "abcabcdbcaa\n"
input_str1_len = . - input_str1
input_str2: .ascii "hello world\n"
input_str2_len = . - input_str2

.section .text
.global _start
.extern safe_factorial
.extern raise_to_power
.extern add_two_num
.extern sum_of_squares
.extern two_sum
#.extern longest_unique_substring

_start:
  mov rdi, 4
  mov rsi, 9
  call add_two_num

  mov rdi, 3
  call sum_of_squares

  mov rdi, 5
  call safe_factorial

  lea rdi, [two_sum_num_arr] 
  mov rsi, two_sum_num_arr_size
  mov rdx, two_sum_target
  call two_sum

  write STDOUT, [input_str1], input_str1_len
  #mov rdi, input_str1
  #call longest_unique_substring

  write STDOUT, [input_str2], input_str2_len
  #mov rdi, input_str2
  #call longest_unique_substring

  exit 0


