.intel_syntax noprefix
.section .note.GNU-stack

.section .text
.global raise_to_power

raise_to_power:
  mov rax, 1
  mov rcx, rsi
loop:
  imul rax, rdi
  dec rcx
  cmp rcx, 0
  jg loop
  ret

