section .note.GNU-stack

section .text
global raise_to_power

raise_to_power:
  mov rax, 0x1
  mov r8, rsi
loop:
  imul rax, rdi
  sub r8, 0x1
  cmp r8, 0x0
  jg loop
  ret

