section .text
	global _ft_strcpy

_ft_strcpy:
	xor rax, rax

.while:
	cmp byte [rsi + rax], 0
	je .end

	mov r10, [rsi + rax]
	mov [rdi + rax], r10
	inc rax
	jmp .while


.end:
	mov mov [rdi + rax], 0
	ret 