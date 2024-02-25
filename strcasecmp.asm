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
.convert_str1:
    mov r8b, byte [rdi + rcx]
    cmp r8b, 0
    je .convert_str2
    cmp r8b, 'A'
    jl .not_upper_str1
    cmp r8b, 'Z'
    jg .not_upper_str1
    add r8b, 'a' - 'A'
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .convert_str1

.convert_str2:
    xor rcx, rcx
    jmp .convert_str2_loop
   
.convert_str2_loop:
    mov r9b, byte [rsi + rcx]
    cmp r9b, 0
    je .convertion_finish
    cmp r9b, 'A'
    jl .not_upper_str2
    cmp r9b, 'Z'
    jg .not_upper_str2
    add r9b, 'a' - 'A'
    mov byte [rsi + rcx], r9b
    inc rcx
    jmp .convert_str2_loop

.not_upper_str1:
    inc rcx
    jmp .convert_str1

.not_upper_str2:
    inc rcx
    jmp .convert_str2_loop

.convertion_finish:
    xor rcx, rcx
    jmp .loop

.loop:
    mov r10b, byte [rdi + rcx]
    mov r11b, byte [rsi + rcx]
    cmp r10b, r11b
    jb .lower
    ja .higher
    cmp byte r10b, 0
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