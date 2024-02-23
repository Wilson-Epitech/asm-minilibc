; bits 64

; global my_strpbrk

; section .text
; my_strpbrk:
;     xor r8, r8
;     xor rax, rax
;     xor rcx, rcx

; .loop:
;     cmp byte [rdi + rcx], sil
;     je .found
;     cmp byte [rdi + rcx], 0
;     je .not_found
;     inc rcx
;     jmp .loop

; .found:
;     mov rax, rdi
;     add rax, rcx
;     ret

; .not_found
;     cmp, 0
;     je .end
;     inc rsi
;     jmp .loop

; .end:
;     ret

bits 64

global strpbrk

section .text
strpbrk:
    xor r10b, r10b
    xor r9, r9
    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rsi + r9], 0
    je .end
    cmp byte [rdi + rcx], 0
    je .end
    add r10b, byte [rsi + r9]
    cmp byte [rdi + rcx], r10b
    je .found
    jne .not_found

.found:
    mov rax, rsi
    add rax, r9
    ret

.not_found:
    inc r9
    inc rcx
    jmp .loop

.end:
    ret