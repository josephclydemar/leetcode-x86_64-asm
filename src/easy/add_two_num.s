section .note.GNU-stack
section .text
global add_two_num

add_two_num:
  lea rax, [rdi + rsi]
  ret

