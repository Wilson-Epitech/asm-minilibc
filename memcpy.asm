bits 64

global memcpy

section .text
memcpy:
    xor r8, r8
    xor rcx, rcx

.loop:   
    cmp rcx, rdx
    je .end
    mov r9b, [rsi + rcx]
    mov [rdi + r8], r9b
    inc r8
    inc rcx
    jmp .loop

.end:
  ret
