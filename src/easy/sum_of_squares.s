section .note.GNU-stack

section .text
global sum_of_squares

sum_of_squares:
  mov rax, 0x0
  mov r8, rdi
  cmp r8, 0x0
  jle return_to_caller
loop:
  mov r9, r8
  imul r9, r8
  add rax, r9
  sub r8, 0x1
  cmp r8, 0x0
  jg loop
return_to_caller:
  ret

