%include "t_list.inc"
extern ft_list_new

section .text
    global ft_list_push_front

ft_list_push_front:
    xor rax, rax

    test rdi, rdi
    jz .end

.alloc:
    push rdi
    mov rdi, rsi
    call ft_list_new
    pop rsi

    mov r8, [rsi]  ; node 1
    mov [rsi], rax ; node 2
    mov [rax + t_list.next], r8 ; node 2 pointe vers node 1

.end:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits