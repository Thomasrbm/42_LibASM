section .data
	idx db 0   ; mauvais.  avoir un idx dans la ram 
				; car appel ram chaque fois est tres lent, registre plus rapide
				; ici use rax directement car sera le return


section .text
	_start


_start:  ; pas de start car c est un fonction ici, pas un main
	while
	ret


while:  ; use des label locaux avec . au debut et si pas local _ au debut
	cmp idx, 0
	je ret_while

ret_while:  ; plutot fin_while que ret
	mov rax, idx