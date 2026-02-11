extern malloc
extern ft_strlen

section .text
	global ft_strdup

ft_strdup:
	call ft_strlen wrt ..plt
	inc rax
	push rdi
	mov rdi, rax
	call malloc wrt ..plt
	pop rdi

	xor rcx, rcx

.alloc:
	mov rsi, [rdi + rcx]
	mov [rax + rcx], rsi
	
	cmp byte [rax + rcx], 0
	je .end

	inc rcx
	jmp .alloc

.end:
	ret




section .note.GNU-stack noalloc noexec nowrite progbits
