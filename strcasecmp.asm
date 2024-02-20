bits 64

global strcasecmp

section .text
strcasecmp:
    xor r8b, r8b
    xor r9b, r9b
    xor r10b, r10b
    xor r11b, r11b
    xor rcx, rcx
 
.convert_to_lower:
.convert_str1
    mov r8b, byte [rdi + rcx]
    cmp r8b, 0
    je .loop
    cmp r8b, 'A'
    jl .not_upper
    cmp r8b, 'Z'
    jg .not_upper
    add r8b, 'a' - 'A'
    mov byte [rdi + rcx], r8b
 
.convert_str2
    mov r9b, byte [rsi + rcx]
    cmp r9b, 0
    je .loop
    cmp r9b, 'A'
    jl .not_upper
    cmp r9b, 'Z'
    jg .not_upper
    add r9b, 'a' - 'A'
    mov byte [rsi + rcx], r9b

.not_upper:
    inc rcx
    jmp .convert_to_lower

.loop:
    mov r10b, byte [rdi + rcx]
    jmp .equal 
    mov r11b, byte [rsi + rcx]
    cmp r10b, r11b
    jl .lower
    jg .higher
    cmp byte r10b, 0
    je .equal
    inc rcx
    jmp .loop

.equal:
    mov rax, rax
    ret

.lower:
    mov rax, -1
    ret

.higher:
    mov rax, 1
    ret