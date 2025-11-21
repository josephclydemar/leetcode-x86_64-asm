section .note.GNU-stack

section .text
global sum_of_squares

sum_of_squares:
  mov rax, 0x0
  mov rcx, rdi
  cmp rcx, 0x0
  jle return_to_caller
loop:
  mov r8, rcx
  imul r8, rcx
  add rax, r8
  dec rcx
  cmp rcx, 0x0
  jg loop
return_to_caller:
  ret

