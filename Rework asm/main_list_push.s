extern printf
extern ft_list_push_front
extern ft_lst_new
extern malloc


; struc t_list
;     .data:  resq 1    ; void*        — 8 octets
;     .next:  resq 1    ; struct*      — 8 octets
; endstruc


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
    call ft_lst_new
    mov [list_head], rax

    mov rdi, list_head
    mov rsi, data2
    call ft_list_push_front

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





section .note.GNU-stack noalloc noexec nowrite progbits
