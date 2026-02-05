extern ft_strcpy
extern printf

section .data
	string db "hello", 0
	format db "string dest = %s", 10, 0

section .bss
	dest resb 100

section .text
	global main


main:
	mov rdi, dest
	mov rsi, string
	call ft_strcpy
	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
