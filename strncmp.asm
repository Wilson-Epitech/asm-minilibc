bits 64

global strncmp

section .text
strncmp:
    xor r8b, r8b
    xor r9b, r9b
    xor rcx, rcx

.loop:
    cmp rcx, rdx
    je .equal
    mov r8b, byte [rdi + rcx] 
    mov r9b, byte [rsi + rcx]
    cmp r8b, r9b
    jl .lower
    jg .higher
    cmp byte r8b, 0
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
