%include "t_list.inc"

section .text
    global ft_list_remove_if

ft_list_remove_if:

    test rdi, rdi
    jz .end

    mov r8, rdi
    mov r9, rsi
    mov r10, rdx
    mov r11, rcx

.loop:
    

.remove:

.next:
    mov rdi, [r8]



.end:
    ret




section .note.GNU-stack noalloc noexec nowrite progbits