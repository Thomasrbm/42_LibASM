extern ft_strlen

section .text
	global ft_atoi_base

ft_atoi_base:
	xor rax, rax
	mov r11, 1

.verif_string
	cmp [rdi, rax], 9
	je .skip
	cmp [rdi, rax], 10
	je .skip
	cmp [rdi, rax], 11
	je .skip
	cmp [rdi, rax], 12
	je .skip
	cmp [rdi, rax], 13
	je .skip
	cmp [rdi, rax], 32
	je .skip
	cmp [rdi, rax], 43
	je .skip

	cmp [rdi, rax], 45
	je .set_neg

	cmp [rdi, rax], 0
	je .error

verif_len_base:
	push rdi
	mov rdi, rsi
	call ft_strlen wrt ..plt
	cmp rax, 1
	jl .error
	pop rdi
	mov r10, rax
	xor rax, rax


.verif_base:
	cmp [rsi + rax], 0
	je .next

	mov rcx, rax
	inc rcx
	mov r8, [rsi + rax]
	jmp .doublon


.next:
	xor rax, rax
	xor rcx, rcx
	xor r9, r9

.atoi:
	mov r8, [rdi + rcx]
	cmp r8, 0
	je .end

.indice:


.fill:
	imul rax, r10
	add rax, rdx

	inc rcx 
	jmp .atoi


.end:
	ret

.error:
	mov rax, 0
	ret

.skip:
	inc rax
	jmp .verif_string


.set_neg:
	neg r11
	inc rax
	jmp verif_string

.doublon:
	cmp [rsi + rcx], 0
	je .char_valid_base

	cmp r8, [rsi + rcx]
	je .error

	inc rcx
	jmp .doublon


.char_valid_base:
	cmp [rsi + rax], 43
	je .error
	cmp [rsi + rax], 45
	je .error
	cmp [rsi + rax], 9
	je .error
	cmp [rsi + rax], 10
	je .error
	cmp [rsi + rax], 11
	je .error
	cmp [rsi + rax], 12
	je .error
	cmp [rsi + rax], 13
	je .error	
	cmp [rsi + rax], 32
	je .error

	jmp .verif_base
