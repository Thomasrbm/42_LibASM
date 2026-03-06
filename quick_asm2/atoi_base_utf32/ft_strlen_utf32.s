section .text
    global ft_strlen_utf32

ft_strlen_utf32:
    xor rax, rax

.loop:
    cmp dword [rdi + rax*4], 0
    jz .done

    inc rax
    jmp .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits