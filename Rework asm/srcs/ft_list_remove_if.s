%include "t_list.inc"

section .text
global ft_list_remove_if

ft_list_remove_if:
    mov r8, rdi             ; r8 = begin_list
    mov r9, rsi             ; r9 = data_ref
    mov r10, rdx            ; r10 = cmp
    mov r11, rcx            ; r11 = free_fct
    test rdi, rdi
    jz .ret

.loop:
    mov rdi, [r8]           ; current
    test rdi, rdi
    jz .ret
    mov rdi, [rdi + t_list.data]
    mov rsi, r9
    call r10                ; cmp(current->data, data_ref)
    test rax, rax
    jnz .advance            ; si pas trouve, next

.remove:
    mov rdi, [r8]                   ; current ET previous->next aussi
    mov rcx, [rdi + t_list.next]    ; current->next
    mov [r8], rcx                   ; current/previous->next = current->next
    call r11                        ; free_fct(current)
    jmp .loop

    ;       [r8] 
    ; r8 -> rdi -> rcx -> 
    ; r8 -> 1   -> 2    -> 3 ->4

    ; iteration 1 = begin list devient le 2e

    ; autres iteration = modifie le previous next pour pointer en sautant un node

.advance:
    mov rdi, [r8]                   ; remet le current
    lea r8, [rdi + t_list.next]     ; begin_list = &current->next (sera le previous)

    jmp .loop

.ret:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits