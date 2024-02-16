bits 64

global strcasecmp

section .text
strcasecmp:
    xor rcx, rcx

.convert_to_lower:
.convert_str1
    mov al, byte [rdi + rcx]
    cmp al, 0
    je .loop
    cmp al, 'A'
    jl .not_upper
    cmp al, 'Z'
    jg .not_upper
    add al, 'a' - 'A'

.convert_str2
    mov al, byte [rsi + rcx]
    cmp al, 0
    je .loop
    cmp al, 'A'
    jl .not_upper
    cmp al, 'Z'
    jg .not_upper
    add al, 'a' - 'A'

.not_upper:
    inc rcx
    jmp .convert_to_lower

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
    xor eax, eax
    ret

.lower:
    mov eax, -1
    ret

.higher:
    mov eax, 1
    ret