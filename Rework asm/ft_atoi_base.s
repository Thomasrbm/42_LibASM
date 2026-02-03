extern _ft_strlen

section .text
    global _ft_atoi_base





_ft_atoi_base:
    xor rcx, rcx
    xor rdx, rdx
    xor r11, r11
    mov r11, 1

    push rdi        ; push base et string sur stack
    mov rdi, rsi
    push rsi

    call _ft_strlen   ; strlen sur la base
    mov r8, rax        ; r8 stock la len
    xor rax, rax

    pop rsi                   ; recup les args
    pop rdi



.parsing:
    mov al, [rdi + rcx]

    cmp al, 32
    je .skip

    cmp al, 9
    je .skip

    cmp al, 13
    je .skip

    cmp al, 45
    je .set_neg

    cmp al, 43
    je .skip

    cmp al, 0                 ; car par de chiffre/lettres  => base vide
    je .end_error



.save_index_rdi:
    push rcx
    xor rcx, rcx


.check_double:                     ; doublon dans la base
    mov r10b, [rsi + rcx]

    cmp r10b, 0
    je .check_base_len     ; Si toute la base est checkée sans erreur
    
    mov rdx, rcx       ; rdx = int j,  pour la 2e boucle

.while:
    inc rdx
    mov r9b, [rsi + rdx]

    cmp r9b, 0
    je .continue2      ; pas doublon pour ce char, next char
    
    cmp r10b, r9b
    je .end_error_pop  ;  doublon
    
    jmp .while



.check_base_len:
    pop rcx            ;  reprend la position dans str
    cmp r8, 2            ; len de la BASE est pas in a 2
    jl .end_error
    
    xor rax, rax



.index:                                ; boucle compare string et base pour trouver indice (dans dictionnaire de la base)
    mov r10b, [rdi + rcx]            ; le char qu on cherche dans string
    
    cmp r10b, 0                    ; fin de string
    je .sign

    mov r12, 0
    jmp .search_index

.atoi: 
    imul rax, r8     ; mul multplie par rax auto, imul prend 2 arg
    add rax, r12
    
    inc rcx
    jmp .index

.sign: 
    cmp r11, -1
    je .neg

.end:
    ret








.end_error_pop:
    pop rcx

.end_error:
    xor rax, rax
    ret





.search_index:
    mov bl, [rsi + r12]
    cmp bl, 0
    je .sign           ; char de str pas dans la base -> fin
    
    cmp r10b, bl
    je .atoi

    inc r12                ; sinon on inc pour tester index suivant de base
    jmp .search_index

.continue:
    inc rcx
    jmp .parsing

.continue2:
    inc rcx
    jmp .check_double

.skip:
    inc rcx
    jmp .parsing

.set_neg:
    neg r11
    inc rcx
    jmp .parsing

.neg:
    neg rax
    jmp .end

section .note.GNU-stack noalloc noexec nowrite progbits