extern _ft_read
extern printf

section .data
	format db "byte read : %d", 10, 0
	to_read db "to_read.txt", 0

section .bss
	buff resb 100

section .text
	global main

main:
	mov rax, 2
	mov rdi, to_read
	mov rsi, 2
	mov rdx, 0777q
	syscall
	mov rdi, rax
	mov rsi, buff
	mov rdx, 10
	call _ft_read
	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf