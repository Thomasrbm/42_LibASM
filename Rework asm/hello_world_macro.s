%include "inc.inc"


section .data
	text db "hello_world : %d", 10, 0
	nb dd 45

section .text
	global main

main:
	xor rax, rax

hello_world:
	PRINTF_MAC text, nb
	ret



section .note.GNU-stack noalloc noexec nowrite progbits
