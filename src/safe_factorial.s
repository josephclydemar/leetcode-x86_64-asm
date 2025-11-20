section .note.GNU-stack

section .text
global safe_factorial

safe_factorial:
  mov rax, 0x0
  mov r8, rdi
  mov r9, r8
  cmp r8, 0x0
  jl return_to_caller
  cmp r8, 0x1
  jle set_return_value
  cmp r8, 0x14
  jg return_to_caller
  sub r8, 0x1
loop:
  imul r9, r8
  sub r8, 0x1
  cmp r8, 0x0
  jg loop
  mov rax, r9
return_to_caller:
  ret

set_return_value:
  mov rax, 0x1
  jmp return_to_caller

