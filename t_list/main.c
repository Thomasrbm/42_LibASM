#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void            *data;
	struct s_list   *next;
} t_list;

void    ft_list_push_front(t_list **head, void *data);
t_list	*ft_list_new(void *data);
int ft_list_size(t_list *begin);

int main()
{
	t_list  *head;
	t_list *first;
	
	first = ft_list_new("1");

	int result = ft_list_size(first);
	printf("size = %d\n", result);


	head = first;
	ft_list_push_front(&head, "2");

	printf("data = %s\n", (char *)head->data);

	result = ft_list_size(head);
	printf("size = %d\n", result);


	return 0;
}