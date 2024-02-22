bits 64

global strstr

section .text
strstr:
    xor r8, r8  
    xor r9, r9
    xor rcx, rcx

.len:
    cmp byte [rsi + r9], 0
    je .loop
    inc r9
    jmp .len

.loop:
    mov r10b, byte [rdi + rcx]
    cmp r10b, 0
    je .end
    cmp r10b, byte [rsi + r8]
    jne .not_equal
    inc r8
    cmp r8, r9
    je .found
    inc rcx
    jmp .loop

.not_equal:
    inc rcx
    xor r8, r8
    jmp .loop

.found:
    sub r8, r9
    add r8, 1
    mov rax, rdi
    add rax, rcx
    sub rax, r8
    ret

.end:
    ret

