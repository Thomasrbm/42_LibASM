section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax


	test rdi, rdi
	jz .end

	test rsi, rsi
	jz .end


.comp:
	mov r8b, [rdi + rax]
	mov r9b, [rsi + rax]

	cmp r9b, 0
	je .end

	cmp r8b, 0
	je .end

	cmp r8b, r9b
	jne .end

	inc rax
	jmp .comp

.end:
	movzx rax, r8b    ; economise 2 ligne xor en haut 
	movzx rcx, r9b   ; la diff sera bonne MAIS, le gdb pas beau car les autres bit sont "corrupted" donc big nbs
					; on pred que les bit partit 111 et 105

	; mov cl, r9b   ; check avec gdb ce qui ya dans registre sans movzx
	sub rax, rcx     ; PAS AL / R9B calucl sur 8bit = -6, 250 aussi car check sur 8bit lop donc underflow (pas de bit pour le neg
	ret