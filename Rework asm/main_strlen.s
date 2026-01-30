extern printf
extern _ft_strlen


section .data
	string db "test", 0 
	format db "string length = %d", 10, 0

section .text
	global main



main:
	mov rdi, string
	call _ft_strlen
	mov rsi, rax
	mov rdi, format
	xor rax, rax
	call printf
	ret




