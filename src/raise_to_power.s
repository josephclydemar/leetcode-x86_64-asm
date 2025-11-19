section .note.GNU-stack

section .text
global raise_to_power

raise_to_power:
  mov rax, 0x1
  mov rcx, rsi
loop:
  imul rax, rdi
  sub rcx, 0x1
  cmp rcx, 0x0
  jg loop
  ret

