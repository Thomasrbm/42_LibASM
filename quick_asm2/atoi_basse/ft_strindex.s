section .text
    global ft_strindex

ft_strindex:
    xor rax, rax

.loop:
    cmp byte [rdi + rax], sil
    je .end
    cmp byte [rdi + rax], 0
    je .not_found
    inc rax
    jmp .loop

.not_found:
    mov rax, -1

.end:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits