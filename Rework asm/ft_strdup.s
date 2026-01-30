extern malloc
extern _ft_strcpy

section .text
	global _ft_strdup



_ft_strdup:
	xor rcx, rcx



.count:
	cmp byte [rdi + rcx], 0
	je .alloc

	inc rcx
	jmp .count


.alloc:
	inc rcx
	push rdi
	mov rdi, rcx
	call malloc

	test rax, rax  ; maj juste les flag sans rien alouer,  fait & logique
	jz .error ; si 0 malloc a echouer, rax null

.fill:
	pop rsi
	mov rdi, rax
	call _ft_strcpy

.end:
	ret

.error:
	xor rax, rax  ;si malloc echoue renvoit 0 + malloc gere deja errno
	ret

section .note.GNU-stack noalloc noexec nowrite progbits