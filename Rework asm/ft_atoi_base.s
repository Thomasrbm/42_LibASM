
; CHECK AVEC CONVERTER CODE COMMENT ILS FONT ATOI EN ASM  METTRE TRUC EN DESSOUS DU RET ???





section .text
	global _ft_atoi_base



_ft_atoi_base:
	xor rcx, rcx
	xor rdx, rdx
	xor r11, r11

	push rdi
	mov rdi, rsi
	push rsi

	call _ft_strlen
	mov r8, rax
	xor rax, rax


	pop rsi
	pop rdi

.parsing:
	cmp byte [rdi + rcx], 32
	je .skip

	cmp byte [rdi + rcx], 9
	je .skip


	cmp byte [rdi + rcx], 45
	je .set_neg

	cmp byte [rdi + rcx], 0
	jne .continue

	xor rcx, rcx

.check_double:
	mov r10b, [rsi + rcx]
	push rcx
	mov rcx, 0
	jmp .while
	pop rcx

	cmp [rsi + rcx], 0
	jne .continue2
	xor rcx, rcx


.check_base:
	cmp byte [rsi + rcx], 9
	je. error

	cmp byte [rsi + rcx], 42
	je .error

	cmp byte [rsi + rcx], 45
	je .error

	cmp byte [rsi + rcx], 13
	je .error


	cmp byte [rsi + rcx], 0
	jne .continue3

	cmp rcx, 0
	je .error

	cmp rcx, 1
	je .error

	xor rcx, rcx

	push rbx 

.index:
	mov bl, [rsi + rdx]
	cmp byte [rdi + rcx], bl
	je .atoi

	inc rdx
	jmp .index

.atoi: 
	mul rax, r8
	mov r9b, rdx
	add rax, r9b
	

	cmp [rdi + rcx], 0
	jne .coninue5



.sign: 
	cmp, r11, 1
	je .neg


.end:
	pop rbx
	ret



.while:
	cmp byte [rsi + rcx], r10b
	je .error


	cmp byte [rsi + rcx], 0
	jne .continue4

	jmp .check_double



.error:
	xor rax, rax
	ret


.continue:
	inc rcx
	jmp .parsing

.continue2:
	inc rcx
	jmp .check_double

.continue3:
	inc rcx
	jmp .check_base

.continue4:
	inc rcx
	jmp .while

.continue5:
	inc rcx
	jmp .index

.skip:
	inc rcx
	jmp .parsing

.set_neg:
	neg r11
	jmp .parsing

.neg:
	neg rax
	jmp end

.div_ten:
	div rdi, 10
