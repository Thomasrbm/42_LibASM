extern malloc
extern ft_strcpy
extern ft_strlen


section .text
	global ft_strdup

ft_strdup:
	test rdi, rdi
	jz .error

	push rdi
	call ft_strlen
	inc rax

.alloc:
	mov rdi, rax
	call malloc wrt ..plt

	test rax, rax  ; maj juste les flag sans rien alouer,  fait & logique
	jz .error ; si 0 malloc a echouer, rax null

.fill:
	pop rsi
	mov rdi, rax
	call ft_strcpy

.end:
	ret

.error:
	xor rax, rax  ;si malloc echoue renvoit 0 + malloc gere deja errno
	ret

section .note.GNU-stack noalloc noexec nowrite progbits