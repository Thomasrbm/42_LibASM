section .text
	global _ft_strcmp

_ft_strcmp:
	xor rcx, rcx

.compare:
	mov al, byte [rdi + rcx]
	mov dl, byte [rsi + rcx]

	cmp al, 0
	je .end

	cmp dl, 0
	je .end 

	cmp al, dl
	jne .end

	inc rcx
	jmp .compare


.end:
	movzx rax, al
	movzx r11, dl
	sub rax, r11
	ret