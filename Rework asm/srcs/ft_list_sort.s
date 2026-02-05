; quand on appel une fonction on prefere use des callee saved 
; car r12 reviendra inchange, la ou rdx peut avoir changer apres ( donc faut le push a chaque fois) la ou r12 tu push au debut


; calle savec mieux pour les index par exemple. 

section .text
    global ft_list_sort

ft_list_sort:
    push r12
    push r13
    push r14
    push r15
    
    mov r12, rdi    
    mov r13, rsi
    
    test r12, r12
    jz .final_exit
    cmp qword [r12], 0
    jz .final_exit

.restart_sort:
    xor r11, r11
    mov r14, r12            ; revient sur Begin list
    mov r8, [r12]



.sort:
    mov r9, [r8 + 8]
    test r9, r9
    jz .check_swapped


    push r11
    push r14
    push r8
    push r9
    
    mov rdi, [r8]
    mov rsi, [r9]
    call r13
    
    pop r9
    pop r8
    pop r14
    pop r11

    cmp rax, 0
    jg .switch
    
    lea r14, [r8 + 8]       ;  pointe vers previous r8                      SI MOV CA FAIT DE LA MERDE
    mov r8, [r8 + 8]
    jmp .sort


; lea recalul l adress du premier arg (sans changer le contenu)

; lea     r9  0x900       r9->next 0x908   (pointe vers r8)           r8 0x600             lea maj l adress en calculant l offset   0x908
; mov                                                                                   mov prend 0x600


; en C 

; **indirect

;  mov [r14], r9	         *indirect = r9;             ===>   r14 =  r14 = 0x800               [r14] = DATA                   => devient pointeur simple 
; lea r14, [r9 + 8]	        indirect = &(r9->next)      ===>   r14 =  r14 (l'adresse) = 0x908   [r14] (le contenu) = 0x800      => deplace curseur du ** 


; r8 -> r9 -> etc
; 


.switch:

    mov r11, 1
    
    mov rax, [r9 + 8]
    mov [r8 + 8], rax
    mov [r9 + 8], r8
    mov [r14], r9           ; begin (r12) pointe vers le nouveau premier (la PREMIERE FOIS),  APRES  tjrs previous r8  (ici r9 apres un switch)  car  le lea au dessus keep on track de ca
    
    lea r14, [r9 + 8]   ; =============> pointe sur next de previous r8        SI MOV CA FAIT DE LA MERDE
    jmp .sort


.check_swapped:
    test r11, r11
    jnz .restart_sort

.final_exit:
    pop r15
    pop r14
    pop r13
    pop r12
    ret



section .note.GNU-stack noalloc noexec nowrite progbits