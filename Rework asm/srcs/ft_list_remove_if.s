%include "t_list.inc"

section .text
global ft_list_remove_if

ft_list_remove_if:
    mov     r8, rdi         ; r8 = curseur (commence sur begin_list, avance)
    mov     r9, rsi         ; r9 = data_ref
    mov     r10, rdx        ; r10 = cmp
    mov     r11, rcx        ; r11 = free_fct
    test    rdi, rdi
    jz      .ret

.loop:
    mov     rdi, [r8]       ; rdi = current
    test    rdi, rdi
    jz      .ret

    mov     rdi, [rdi + t_list.data]
    mov     rsi, r9
    call    r10             ; cmp(current->data, data_ref)

    test    rax, rax
    jnz     .advance

.remove:
    mov     rdi, [r8]               ; rdi = current
    mov     rcx, [rdi + t_list.next]; rcx = current->next
    mov     [r8], rcx               ; *curseur = current->next
    call    r11                     ; free_fct(current)
    jmp     .loop

.advance:
    mov     rdi, [r8]               ; rdi = current
    lea     r8, [rdi + t_list.next] ; r8 avance vers &current->next
    jmp     .loop

.ret:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits