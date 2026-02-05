extern ft_strcmp
extern printf


section .data
	string1 db "hello", 0
	string2 db "helli", 0
	format db "diff = %d", 0


section .text
	global main

main:
	mov rdi, string1
	mov rsi, string2
	call ft_strcmp

	; mov byte [rdi], 69 ; impossible en rodata

	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	ret

