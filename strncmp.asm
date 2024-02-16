bits 64

global strncmp

section .text
strncmp:
    mov rax, rdx
    xor rcx, rcx

.loop:
    cmp rcx, rax
    je .equal
    mov al, byte [rdi + rcx] 
    mov dl, byte [rsi + rcx]
    cmp al, dl
    jl .lower
    jg .higher
    cmp byte al, 0
    je .equal
    inc rcx
    jmp .loop

.equal:
    xor eax, eax
    ret

.lower:
    mov eax, -1
    ret

.higher:
    mov eax, 1
    ret
