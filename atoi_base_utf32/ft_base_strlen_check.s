section .text
global ft_base_strlen_check

ft_base_strlen_check:
    xor     rax, rax                ; rax = compteur = 0

section .text
global ft_base_strlen_check

ft_base_strlen_check:
    xor     rax, rax                ; rax = compteur = 0

.loop:
    cmp     dword [r9 + rax*4], 0  ; fin de base ?
    je      .check_len              ; oui → vérifie longueur
    
    mov     ecx, [r9 + rax*4]      ; ecx = base[rax]

    cmp     ecx, 9
    jl      .next                   ;  en dessous de 9 = ok
    cmp     ecx, 13
    jle     .invalid                ; en dessous de 13 et au dessus de 9

    cmp     ecx, '+'               ; est-ce un '+' ?
    je      .invalid                ; oui → base invalide
    cmp     ecx, '-'               ; est-ce un '-' ?
    je      .invalid                ; oui → base invalide
    cmp     ecx, ' ' ?
    je      .invalid

.next:
    inc     rax                     ; compteur++
    jmp     .loop                   ; reboucle

.check_len:
    cmp     rax, 2                  ; longueur >= 2 ?
    jl      .invalid                ; non → base invalide
    ret                             ; rax = longueur, valide

.invalid:
    xor     rax, rax                ; retourne 0 (invalide)
    ret

section .note.GNU-stack noalloc noexec nowrite progbits