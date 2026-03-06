%include "t_list.inc"
extern ft_list_new
extern printf
extern ft_list_size
extern ft_list_push_front

section .bss
    head resq 1


section .data
    format db "size of list = %d", 0


section .text
    global main

main:
    mov rdi, 1
    call ft_list_new
    mov [rel head], rax


    lea rdi, [rel head]
    mov rsi, 2
    call ft_list_push_front

    lea rdi, [rel head]
    mov rsi, 3
    call ft_list_push_front


    mov rdi, [rel head]
    call ft_list_size

    lea rdi, [rel format]
    mov rsi, rax
    xor rax, rax
    call printf wrt ..plt

section .note.GNU-stack noalloc noexec nowrite progbits