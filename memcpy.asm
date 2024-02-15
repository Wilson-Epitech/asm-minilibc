bits 64

global my_memcpy

section .text
my_memcpy:
    xor rax, rax
    xor rcx, rcx

.loop:   
    cmp rcx, rdx
    je .end
    mov rax, [rsi + rcx]
    mov [rdi + rcx], rax
    inc rcx
    jmp .loop

.end:
  mov rax, rdi
  ret
