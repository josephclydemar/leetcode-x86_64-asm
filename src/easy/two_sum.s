section .note.GNU-stack

section .text
global two_sum

; nums_arr:         rdi
; nums_arr_size:    rsi
; target:           rdx
two_sum:
  mov r8, 0x0   ; idx1 (uint64_t)
  mov r9, 0x1   ; idx2 (uint64_t)
  mov rcx, 0x0
  jmp loop_r9

loop_r8:
  inc r8
  lea r9, [r8 + 0x1]
loop_r9:
  mov r10, qword [rdi + r8 * 0x8]
  mov r11, qword [rdi + r9 * 0x8]
  lea rcx, [r10 + r11]
  cmp rcx, rdx
  je return_to_caller

  inc r9
  lea rax, [rsi - 0x1]
  cmp r9, rax
  je loop_r8
  jmp loop_r9
return_to_caller:
  mov rax, r8
  mov rdx, r9
  ret

