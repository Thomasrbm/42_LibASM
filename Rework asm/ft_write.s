extern __errno_location

section .text
	global _ft_write

_ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl .error
	ret

.error:
	neg rax
	mov rdi, rax
	push rdi
	call __errno_location
	pop rdi
	mov [rax], rdi
	mov rax, -1
	ret