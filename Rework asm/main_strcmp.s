extern printf
extern _ft_strcmp

section .data
	string1 db "hellq", 0
	string2 db "hello", 0
	format db "diff = %d", 10, 0

section .text
	global main


main:
	mov rdi, string1
	mov rsi, string2
	call _ft_strcmp
	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf
	
