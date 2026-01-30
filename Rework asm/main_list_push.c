#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
    void          *data;
    struct s_list *next;
} t_list;


extern void _ft_list_push_front(t_list **begin_list, void *data);

void print_list(t_list *begin, char *title)
{
    printf("\n--- ETAT DE LA LISTE : %s ---\n", title);
    if (!begin)
    {
        printf("(La liste est vide)\n");
        return;
    }
    
    t_list *current = begin;
    while (current)
    {
        printf(" [Node] data: %-10s | next: %p\n", (char *)current->data, current->next);
        current = current->next;
    }
}

int main(void)
{
    t_list *begin = NULL;

    print_list(begin, "AVANT");

    _ft_list_push_front(&begin, "Premier");
    _ft_list_push_front(&begin, "Deuxieme");
    _ft_list_push_front(&begin, "Troisieme");

    print_list(begin, "APRES");

    return (0);
}