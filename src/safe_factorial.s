section .note.GNU-stack

section .text
global safe_factorial

safe_factorial:
  mov rax, 0x0
  mov r9, r8
  mov r8, rdi
  cmp r8, 0x0
  jle return_to_caller
  sub r8, 0x1
loop:
  imul r9, r8
  sub r8, 0x1
  cmp r8, 0x0
  jg loop
  mov rax, r9
return_to_caller:
  ret

