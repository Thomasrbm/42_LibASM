extern ft_atoi_base
extern printf
extern ft_strlen


section .data
	string db "nn", 0
	base db "poneyvif", 0
	format db "conversion = %d"

section .text
	global main

main:
	mov rdi, string
	mov rsi, base
	call ft_atoi_base

	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf

	ret







section .note.GNU-stack noalloc noexec nowrite progbits