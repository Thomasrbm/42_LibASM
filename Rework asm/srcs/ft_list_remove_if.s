section .text
    global ft_list_remove_if
    extern free

ft_list_remove_if:
    test rdi, rdi
    jz .ret


    push r12
    push r13
    push r14
    push r15
    mov r12, rdi            ; r12 = begin_list
    mov r13, rsi            ; r13 = data_ref
    mov r14, rdx            ; r14 = cmp
    mov r15, rcx            ; r15 = free_fct

.loop:
    mov r8, [r12]           ; current = *begin  / current next  car [r12 = valeur]
    test r8, r8             ; if (!current) break
    jz .done
    
    push r12
    mov rdi, [r8]
    mov rsi, r13
    call r14
    pop r12
    
    test eax, eax
    jnz .advance
    
.remove:
    mov r10, [r8 + 8]       ; current->next  (donc r)
    mov [r12], r10          ; begin = current next     / current next = current next
    
    mov rdi, [r8]
    call r15
    
    mov rdi, r8
    call free wrt ..plt 
    
    jmp .loop

.advance:
    lea r12, [r8 + 8]       ;   adresse de current next. (pas la valeur de current next) 
    jmp .loop

.done:
    pop r15
    pop r14
    pop r13
    pop r12
.ret:
    ret



section .note.GNU-stack noalloc noexec nowrite progbits