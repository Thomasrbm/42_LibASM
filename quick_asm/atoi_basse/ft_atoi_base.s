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
    lodsb
    cmp al, 32
    je .skip
    sub al, 9
    cmp al, 4
    jbe .skip
    add al, 9
    cmp al, '+'
    je .skip 
    sub al, '-'
    jnz .convert
    inc r15
    jmp .skip

.convert:
    xor r8d, r8d
    dec rsi

.loop:
    movzx edi, byte [rsi]
    test edi, edi
    jz .done
    push rsi
    mov rsi, rdi
    mov rdi, r13
    call ft_strindex
    pop rsi
    cmp rax, -1
    je .done
    imul r8, r14
    add r8, rax
    inc rsi
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