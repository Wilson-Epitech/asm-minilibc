bits 64

global my_strrchr

section .text
my_strrchr:
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
    dec rcx;
    cmp rcx, 0
    je .end
    jmp .loop

.found:
mov rax, rdi
add rax, rcx
ret

.end:
  mov rax, 0
  ret