
extern ft_strlen

section .bss
	string resb 20

section .data
	msg db "hello", 0

section .text
	global _start

_start:
	mov rdi, msg
	call ft_strlen

	add rax, 48
	mov [string], rax

	mov rdi, 1
	mov rsi, string
	mov rdx, 5

	mov rax, 1
	syscall

	mov rax, 60
	syscall
	ret