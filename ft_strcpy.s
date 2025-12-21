section .text


_strcpy:
	xor rax, rax


.while:
	cmp byte [rsi + rax], 0
	je .fin_while

	mov dl, [rsi + rax]
	mov byte [rdi + rax], dl
	inc rax
	jmp .while

.fin_while:
	mov  byte [rdi + rax], 0
	ret