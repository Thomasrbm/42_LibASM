extern __errno_location

section .text
	global ft_write

ft_write:
	mov rax, 1
	syscall

	test rax, rax
	jl .error

	ret

.error:
	neg rax					; contion la valeur errno en neg
	mov rdi, rax
	push rdi
	call __errno_location wrt ..plt
	pop rdi
	mov [rax], rdi
	mov rax, -1    ; -1 pour les ft,  1 pour l exit code programme
	ret