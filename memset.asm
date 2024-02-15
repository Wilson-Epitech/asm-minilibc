bits 64

global my_memset

section .text
my_memset:
    xor rax, rax
    xor rcx, rcx

.loop:   
    cmp rcx, rdx
    je .end
    mov byte [rdi + rcx], sil
    inc rcx
    jmp .loop

.end:
  mov rax, rdi
  ret
