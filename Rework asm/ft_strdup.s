extern malloc

section .text
	global _ft_strdup

_ft_strdup:
	xor rax, rax
	xor rcx, rcx
	mov r10, rdi

.count:
	mov al, byte [r10 + rcx]
	cmp al, 0
	je .alloc

	inc rcx
	jmp .count



.alloc:
	inc rcx
	mov rdi, rcx
	call malloc 
	mov rcx, 0

.fill:
	mov r11b, byte [r10 + rcx]
	mov byte [rax + rcx], r11b

	cmp r11b, 0
	je .end

	inc rcx 
	jmp .fill

.end:
	ret
