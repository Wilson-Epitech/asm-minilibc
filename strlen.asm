bits 64

global my_strlen

section .text
my_strlen:
    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi + rcx], 0
    je .end
    inc rcx
    jmp .loop

.end:
  mov rax, rcx
  ret