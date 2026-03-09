#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct s_list {
    void            *data;
    struct s_list   *next;
} t_list;

// Prototype de ta fonction ASM
extern void ft_list_sort(t_list **begin_list, int (*cmp)());

// Fonction de comparaison simple (strcmp)
int ft_strcmp(const char *s1, const char *s2) {
    return strcmp(s1, s2);
}

// Utilitaire pour créer un nouveau maillon
t_list *new_node(char *str) {
    t_list *node = malloc(sizeof(t_list));
    node->data = str;
    node->next = NULL;
    return node;
}

int main() {
    // Construction d'une liste : "C" -> "A" -> "B"
    t_list *c = new_node("C");
    t_list *a = new_node("A");
    t_list *b = new_node("B");

    c->next = a;
    a->next = b;

    t_list *head = c;

    printf("Avant tri : ");
    for (t_list *tmp = head; tmp; tmp = tmp->next) printf("%s ", (char *)tmp->data);
    printf("\n");

    printf("Tentative de tri...\n");
    // On passe l'adresse du pointeur de tête (&head)
    ft_list_sort(&head, ft_strcmp);

    printf("Après tri  : ");
    for (t_list *tmp = head; tmp; tmp = tmp->next) printf("%s ", (char *)tmp->data);
    printf("\n");

    return 0;
}