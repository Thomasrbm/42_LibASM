extern printf
extern push_front
extern lst_new
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
    call lst_new
    mov [list_head], rax

    mov rdi, list_head
    mov rsi, data2
    call push_front

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
