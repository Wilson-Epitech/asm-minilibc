bits 64

global strrchr

section .text
strrchr:
    xor rax, rax
    xor rcx, rcx

.len_loop:
    cmp byte [rdi + rcx], 0
    je .loop
    inc rcx
    jmp .len_loop

.loop:
    cmp byte [rdi + rcx], sil
    je .found
    cmp rcx, 0
    je .end
    dec rcx;
    jmp .loop

.found:
mov rax, rdi
add rax, rcx
ret

.end:
  mov rax, 0
  ret