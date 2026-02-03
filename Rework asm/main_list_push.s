extern printf
extern _ft_list_push_front
extern _ft_lst_new
extern malloc

section .bss
    list_head resq 1    ; *begin

section .data
    data1 db "data1", 0
    data2 db "data2", 0
    format db "list : %s", 10, 0

section .text
    global main

main:
    mov rdi, data1
    call _ft_lst_new
    mov [list_head], rax

    mov rdi, list_head
    mov rsi, data2
    call _ft_list_push_front

    mov rdi, format
    mov rbx, [list_head]   
    mov rsi, [rbx]
    xor rax, rax
    call printf

    mov rdi, format
    mov rbx, [rbx + 8]
    mov rsi, [rbx]
    xor rax, rax
    call printf
    jmp .done


.done:
    ret


