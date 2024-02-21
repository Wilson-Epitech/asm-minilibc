bits 64

global strchr

section .text
strchr:
    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi + rcx], sil
    je .found
    cmp byte [rdi + rcx], 0
    je .end
    inc rcx
    jmp .loop

.found:
    mov rax, rdi
    add rax, rcx
    ret

.end:
    ret