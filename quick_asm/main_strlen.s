extern printf
extern ft_strlen


section .data
	string db "test", 0
	format db "len = %d", 0

section .text
	global main



main:

	lea rdi, [rel string]
	call ft_strlen

	lea rdi, [rel format]     ; rel  va chercher l adresse dynamique (pie), donc lea, sinon tu mov l adress et plus la string.
	mov rsi, rax 
	xor rax, rax
	call printf wrt ..plt
	ret     				; peut crash ou non sans. (selon si tu met en PIE ou non) remet le EIP au bon endroit. sinon le eip va try 

section .note.GNU-stack noalloc noexec nowrite progbits