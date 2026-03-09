%include "t_list.inc"

extern malloc

section .text
    global ft_list_new


ft_list_new:
    xor     rax, rax
    push    rdi
    mov     rdi, t_list_size
    call    malloc wrt ..plt
    pop     rdi

    test    rax, rax
    jz      .ret

    mov     [rax + t_list.data], rdi
    mov     qword [rax + t_list.next], 0

.ret:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits







