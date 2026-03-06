section .text
    global ft_strindex

ft_strindex:
    xor rax, rax

.loop:
    cmp dword [rdi + rax*4], esi
    je .end
    cmp dword [rdi + rax*4], 0
    je .not_found
    inc rax
    jmp .loop

.not_found:
    mov rax, -1
.end:
    ret


section .note.GNU-stack noalloc noexec nowrite progbits