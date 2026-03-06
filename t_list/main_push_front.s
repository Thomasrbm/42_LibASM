%include "t_list.inc"
extern ft_list_new
extern ft_list_push_front
extern printf

section .bss
    head resq 1

section .data
    format db "data first node = %d", 0

section .text
    global main

main:
    mov rdi, 1
    call ft_list_new
    lea rdi, [rel head]
    mov [rdi], rax
    mov rsi, 2
    call ft_list_push_front

    lea rdi, [rel format]
    mov r8, [rel head]
    mov rsi, [r8 + t_list.data]
    xor rax, rax
    call printf wrt ..plt
    ret


section .note.GNU-stack noalloc noexec nowrite progbits