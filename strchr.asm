bits 64

global my_strchr

section .text
my_strchr:
    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi + rcx], 0
    je .end
    cmp byte [rdi + rcx], sil
    je .found
    inc rcx
    jmp .loop

.found:
mov rax, rdi
add rax, rcx
ret

.end:
  mov rax, rcx
  ret