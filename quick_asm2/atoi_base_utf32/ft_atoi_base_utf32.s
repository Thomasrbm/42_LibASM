extern ft_check_base
extern ft_strindex

section .text
    global ft_atoi_base

ft_atoi_base:
    push r12
    push r13
    push r14
    push r15
    mov r12, rdi
    mov r13, rsi
    
    mov rdi, rsi
    call ft_check_base
    test rax, rax
    jz .error
    mov r14, rax
    
    mov rsi, r12
    xor r15d, r15d

.skip:
    lodsd                   ; au lieu de lodsb
    cmp eax, 32
    je .skip
    sub eax, 9
    cmp eax, 4
    jbe .skip
    add eax, 9
    cmp eax, '+'
    je .skip
    sub eax, '-'
    jnz .convert
    inc r15
    jmp .skip
.convert:
    xor r8d, r8d
    sub rsi, 4              ; au lieu de dec rsi
.loop:
    mov edi, dword [rsi]    ; au lieu de movzx edi, byte [rsi]
    test edi, edi
    jz .done
    push rsi
    mov esi, edi            ; le caractère UTF-32 (valeur 32 bits)
    mov rdi, r13
    call ft_strindex
    pop rsi
    cmp rax, -1
    je .done
    imul r8, r14
    add r8, rax
    add rsi, 4              ; au lieu de inc rsi
    jmp .loop

.done:
    mov rax, r8
    bt r15, 0
    jnc .end
    neg rax
    jmp .end

.error:
    xor rax, rax

.end:
    pop r15
    pop r14
    pop r13
    pop r12
    ret

section .note.GNU-stack noalloc noexec nowrite progbits  