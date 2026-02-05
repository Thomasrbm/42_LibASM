extern malloc
extern ft_strlen

section .text
	global ft_strdup

ft_strdup:
	call ft_strlen
	push rdi


.alloc:
	mov rdi, rax
	call malloc wrt ..plt

	test rax, rax
	jz .error

	pop rdi
	xor rcx, rcx

.fill:
	mov r8b, byte [rdi + rcx]
	mov byte [rax + rcx], r8b

	cmp r8b, 0
	je .end


	inc rcx
	jmp .fill

.end:
	ret

.error:
	pop rdi
	ret








