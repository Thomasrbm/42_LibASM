extern _ft_strdup
extern printf

section .data
	string db "hello", 0
	format db "dup = %s", 10, 0

section .text
	global main

main:
	mov rdi, string
	call _ft_strdup
	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf
	ret