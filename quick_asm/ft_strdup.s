extern malloc
extern ft_strlen

section .text
	global ft_strdup

ft_strdup:
	xor rax, rax

	call ft_strlen
	inc rax


.alloc:
	push rdi
	mov rdi, rax
	call malloc wrt ..plt
	pop rdi

	xor rcx, rcx

.fill:
	mov dl, byte [rdi + rcx]
	mov byte [rax + rcx], dl

	cmp dl, 0
	je .end

	inc rcx
	jmp .fill


.end:
	ret




section .note.GNU-stack noalloc noexec nowrite progbits
