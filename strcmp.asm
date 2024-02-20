bits 64

global strcmp

section .text
strcmp:
    xor rcx, rcx

.loop:
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
    xor rax, rax
    ret

.lower:
    mov rax, -1
    ret

.higher:
    mov rax, 1
    ret
