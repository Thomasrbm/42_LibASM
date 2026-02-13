section .text
    global ft_atoi_base

ft_atoi_base:
    push rbx
    push r12
    push r13
    push r14
    mov r12, rdi        ; r12 = str
    mov r13, rsi        ; r13 = base
    xor r14, r14        ; r14 = résultat final (accumulateur)

    xor rbx, rbx        ; rbx = base_len
    mov rdi, r13

.count_base:
    cmp byte [rdi], 0
    je .convert
    call .char_size
    add rdi, rax        ; skip de x taille
    inc rbx                 ; count les utf-8 a +1 meme si font 4 octet
    jmp .count_base

.convert:
    movzx rax, byte [r12]   ; stock le char 

    test al, al         ; done
    jz .done
    
    mov rdi, r12        ; get la taille char
    call .char_size
    mov r8, rax         ; r8 = taille du caractère UTF-8 actuel (1-4)
    
    xor r11, r11        ; r11 = INDEX (on n'utilise plus rcx ici)
    mov r10, r13        ; r10 = curseur de parcours base ,   = la str de la base

.search:
    cmp byte [r10], 0
    je .done            ; Pas trouvé dans la base -> fin
    
    mov rsi, r12        ; rsi = char dans string
    mov rdi, r10        ; rdi = char dans base
    mov rcx, r8         ; rcx = nombre d'octets à comparer (cmpsb va le vider)
    repe cmpsb          ; compare les deux tant que sont egal (repeat while equal,  compare string byte)  + decremente rcx
    je .found
    
    mov rdi, r10        ; stock l endroit dans la base
    call .char_size
    add r10, rax        ; avance dans la base
    inc r11
    jmp .search

.found:
    imul r14, rbx       ; result *= base_len
    add r14, r11        ; result += index (r11)
    add r12, r8         ; avancer dans la string
    jmp .convert

.char_size:                         ; skip du nombre de bit que faut le char.
    mov rax, 1          ; pour pas need de xor
    cmp byte [rdi], 128
    jb .cs_ret              ; taille 1
    inc rax
    cmp byte [rdi], 224
    jb .cs_ret              ; taille 2
    inc rax
    cmp byte [rdi], 240
    jb .cs_ret              ; taille 3
    inc rax                 

.cs_ret:
    ret                     ; taille 4

.done:
    mov rax, r14
    pop r14
    pop r13
    pop r12
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits