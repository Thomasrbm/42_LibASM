section .text
	global _ft_strcmp

_ft_strcmp:
	xor rax, rax

.while:
	mov r10, [rsi + rax]
	cmp r10, 0
	
	je .end
	cmp byte [rdi + rax], 0
	je .end
	cmp [rdi + rax], r10
	jne .end

	inc rax
	jmp .while


.end:
	mov r11, [rdi + rax]
	mov rax, r11
	sub rax, r10
	ret