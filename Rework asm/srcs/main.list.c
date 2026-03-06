#include <stdio.h>
#include <stdlib.h>
#include "t_list.h"

int	cmp(void *data, void *ref)
{
	return (*(int *)data - *(int *)ref);
}

void	print_list(t_list *begin)
{
	while (begin)
	{
		printf("%d -> ", *(int *)begin->data);
		begin = begin->next;
	}
	printf("NULL\n");
}

int	main(void)
{
	t_list	*begin;
	int		a = 1, b = 2, c = 3, d = 2;

	// construction de la liste : 1 -> 2 -> 3 -> NULL
	begin = ft_list_new(&a);
	ft_list_push_front(&begin, ft_list_new(&b));
	ft_list_push_front(&begin, ft_list_new(&c));

	printf("avant : ");
	print_list(begin);

	// on supprime tous les noeuds avec data = 2
	ft_list_remove_if(&begin, &d, cmp, free);

	printf("apres : ");
	print_list(begin);  // begin pointe toujours sur le bon premier noeud

	return (0);
}