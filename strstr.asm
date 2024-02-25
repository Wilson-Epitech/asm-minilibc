bits 64

global strstr

section .text
strstr:
    xor r8, r8
    xor r9, r9
    xor rcx, rcx
    cmp byte [rsi], 0
    je .empty

.len:
    cmp byte [rsi + r9], 0
    je .loop
    inc r9
    jmp .len

.empty:
    mov rax, rdi
    ret

.loop:
    mov r10b, byte [rdi + rcx]
    cmp r10b, 0
    je .end
    cmp byte [rsi + r8], 0
    je .found
    cmp r10b, byte [rsi + r8]
    jne .not_equal
    inc r8
    inc rcx
    cmp r8, r9
    je .found
    jmp .loop

.not_equal:
    inc rcx
    jmp .loop

.found:
    sub rcx, r8
    mov rax, rdi
    add rax, rcx
    ret

.end:
    xor rax, rax
    ret
