extern __errno_location

section .text
	global _ft_read

_ft_read:
	mov rax, 0
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


