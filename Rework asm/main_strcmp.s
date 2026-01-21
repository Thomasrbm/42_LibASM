extern _ft_strcmp
extern printf

section .data
	format db "result = %d", 10, 0
	string1 db "hellq", 0
	string2 db "hello", 0

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
	ret  ; sans ret main crash