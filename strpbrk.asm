bits 64

global strpbrk

section .text
; char *strpbrk(const char *s, const char *accept)
; returns a pointer to the first char of s that appears in accept, or NULL
strpbrk:
.outer:
    mov al, byte [rdi]
    test al, al
    je .none
    xor rcx, rcx
.inner:
    mov dl, byte [rsi + rcx]
    test dl, dl
    je .next
    cmp al, dl
    je .found
    inc rcx
    jmp .inner
.next:
    inc rdi
    jmp .outer
.found:
    mov rax, rdi
    ret
.none:
    xor rax, rax
    ret
