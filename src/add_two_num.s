section .note.GNU-stack

section .text
global add_two_num

add_two_num:
  mov rax, rdi
  add rax, rsi
  ret

