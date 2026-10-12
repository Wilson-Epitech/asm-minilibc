bits 64

global strcasecmp

section .text
; int strcasecmp(const char *s1, const char *s2)
; compares both strings ignoring case, without modifying them
strcasecmp:
    xor rcx, rcx
.loop:
    movzx eax, byte [rdi + rcx]
    movzx edx, byte [rsi + rcx]
    cmp al, 'A'
    jb .lower_s2
    cmp al, 'Z'
    ja .lower_s2
    add al, 'a' - 'A'
.lower_s2:
    cmp dl, 'A'
    jb .compare
    cmp dl, 'Z'
    ja .compare
    add dl, 'a' - 'A'
.compare:
    cmp al, dl
    jne .different
    test al, al
    je .equal
    inc rcx
    jmp .loop
.different:
    sub eax, edx
    ret
.equal:
    xor eax, eax
    ret
