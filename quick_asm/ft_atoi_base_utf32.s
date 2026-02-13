section .text
    global ft_atoi_base_utf32

ft_atoi_base_utf32:
    push rbx
    push r12
    push r13
    push r14
    mov r12, rdi        ; r12 = str (pointeur sur dwords)
    mov r13, rsi        ; r13 = base (pointeur sur dwords)
    xor r14, r14        ; r14 = résultat

    xor rbx, rbx
    mov rdi, r13

.count_base:
    cmp dword [rdi + rbx*4], 0  ; On avance de 4 en 4
    je .convert
    inc rbx
    jmp .count_base

.convert:
    mov eax, dword [r12]        ; On lit le caractère actuel (4 octets)
    test eax, eax
    jz .done
    
    xor r11, r11                ; r11 = INDEX

.search:
    mov edx, dword [r13 + r11*4] ; On lit le caractère de la base
    test edx, edx
    jz .done                     ; Pas trouvé dans la base

    cmp eax, edx                 ; COMPARAISON DIRECTE 32 bits
    je .found
    inc r11
    jmp .search

.found:
    imul r14, rbx                ; result *= base_len
    add r14, r11                 ; result += index
    add r12, 4                   ; ON AVANCE DE 4 FIXE
    jmp .convert

.done:
    mov rax, r14
    pop r14
    pop r13
    pop r12
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits