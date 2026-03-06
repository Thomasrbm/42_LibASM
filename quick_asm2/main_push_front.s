; https://www.nasm.us/doc/nasm06.html  

extern ft_list_push_front
extern printf

struc t_list
    .data:  resq 1
    .next:  resq 1
endstruc

section .bss
    list_head:  resq 1
    node1:      resb t_list_size

section .data
    format db "data last node = %d", 10, 0

section .text
global main

main:
    mov qword [rel node1 + t_list.data], 1
    mov qword [rel node1 + t_list.next], 0

    lea rax, [rel node1]
    mov [rel list_head], rax

    lea rdi, [rel list_head]
    mov rsi, 2
    call ft_list_push_front wrt ..plt

    lea rdi, [rel format]
    mov rsi, [rel list_head]
    mov rsi, [rsi + t_list.data]
    xor rax, rax
    call printf wrt ..plt


	ret

section .note.GNU-stack noalloc noexec nowrite progbits