section .note.GNU-stack

section .text
global safe_factorial

safe_factorial:
  mov rax, 0x0
  mov rcx, rdi
  mov r8, rcx
  cmp rcx, 0x0
  jl return_to_caller
  cmp rcx, 0x1
  jle set_return_value
  cmp rcx, 0x14
  jg return_to_caller
  dec rcx
loop:
  imul r8, rcx
  dec rcx
  cmp rcx, 0x0
  jg loop
  mov rax, r8
return_to_caller:
  ret

set_return_value:
  mov rax, 0x1
  jmp return_to_caller

