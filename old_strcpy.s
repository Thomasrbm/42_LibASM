section .text


_strcpy:
	xor rax, rax


.while:
	cmp byte [rsi + rax], 0  
	je .fin_while

	mov byte [rdi + rax], [rsi + rax]  ; FAUX DOIT USE REGISTRE INTERMEDIAIRE EN ASM
	inc rax

.fin_while:
	xor rax, rax ; FAUX  ducoup on ecrit  la ligne d apres au mauvais endroit (mettre en dessous) 
				; surtout pas obliger de faire ca
	mov  byte [rdi + rax], 0
	ret