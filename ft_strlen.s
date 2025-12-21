section .text
	_start


_ft_strlen:
	xor rax, rax

.while:
	cmp byte [rdi + rax], 0
	je .fin_while

	inc rax  ; saut de ligne pour la lisibilite (entre je et inc)
	jmp .while



.fin_while:
	ret