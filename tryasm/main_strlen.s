extern printf
extern _ft_strlen

section .data
    msg db "Hello, World", 10, 0  ; msg est un label, alias pour l'adresse hexa du 1er char de la str (un peut les var en c)
    ; 10 = \n , 0 \0
    len equ $ - msg  ; pour les label equ c'est le '=',  $ = pos actuel, msg = pos début du mot  (ici len compte + 1 car prend le 0)
    format_printf db "le nombre est : %d", 10, 0

section .text
    global main

main:
    xor rax, rax
    mov rdi, format_printf
    mov rsi, len
    call printf
    mov rdi, msg
    call _ft_strlen
    mov rdi, format_printf
    mov rsi, rax
    call printf
