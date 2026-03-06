%include "t_list.inc"

section .text
    global ft_list_sort

ft_list_sort:
    mov r8, rdi
    mov r9, rsi

    test rdi, rdi
    jz .end

.restart:
    xor r10, r10
    mov r11, r8

.cmp:
    mov rdi, [r11]
    mov rsi, [rdi + t_list.next]

    test rsi, rsi
    jz .check

    mov rdi, [rdi + t_list.data]
    mov rsi, [rsi + t_list.data]
    call r9 wrt ..plt
    jle .next

swap:
    mov rax, [r11]
    mov rdx, [rax + t_list.next]
    mov rcx, [rdx + t_list.next]
    mov [rax + t_list.next], rcx
    mov [rdx + t_list.next], rax
    mov [r11], rdx
    lea r11, [rdx + t_list.next] 
    mov r10, 1
    jmp .cmp

.next:
    mov rax, [r11]
    lea r11, [rax + t_list.next]
    jmp .cmp

.check
    test r10, r10
    jnz  .restart

.end:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits