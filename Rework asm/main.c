#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

extern int _ft_read(int fd, char *buf, size_t count);
extern int _ft_write(int fd, void *buf, size_t count);
extern char *_ft_strcpy(char *s1, char *s2);
extern int _ft_strcmp(char *s1, char *s2);
extern int _ft_strlen(char *s1);
extern t_list  *_ft_lst_new(void *data);
extern void    _ft_list_push_front(t_list **begin_list, void *data);
extern int	_ft_atoi_base(char *string, char *base);
extern int _ft_list_size(t_list *first);
extern void _ft_list_sort(t_list **begin_list, int (*cmp)());
void _ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
void _ft_remove_data(void *data);

int main()
{
	int fd = open("to_read.txt", O_RDWR | O_CREAT | O_APPEND, 0644);

	_ft_write(fd, "hello\n", 6);

	lseek(fd, 0, SEEK_SET);

	char *buff = malloc(100);
	int byte = _ft_read(fd, buff, 100);
	printf("byte read = %d | content : \n%s\n", byte, buff);

	char *dest = malloc(100);
	char *src = "hello";
	_ft_strcpy(dest, src);

	printf("cpy dest = %s\n", dest);

	int test = _ft_strcmp(dest, src);
	printf("cmp = %d\n", test);

	printf("dest length = %d\n", _ft_strlen(dest));

	t_list *first_list = NULL;

	first_list = _ft_lst_new("1");
	_ft_list_push_front(&first_list, "3");
	_ft_list_push_front(&first_list, "0");
	_ft_list_push_front(&first_list, "51");
	_ft_list_push_front(&first_list, "2");
	_ft_list_push_front(&first_list, "45");
    t_list *tmp = first_list;
    while (tmp)
    {
        printf("Content: %s\n", (char *)tmp->data);
        tmp = tmp->next;
    }

	
	printf("list size : %d\n", _ft_list_size(tmp));

	int try = _ft_atoi_base("17", "01234567");
	printf("atoi base = %d\n", try);


	_ft_list_sort(&first_list, _ft_strcmp);
	tmp = first_list;
	while (tmp)
    {
        printf("Content: %s\n", (char *)tmp->data);
        tmp = tmp->next;
    }


    printf("\n\n\n ======= ERASE ========= \n\n\n");

	_ft_list_remove_if(&first_list, "45", _ft_strcmp, _ft_remove_data);
	tmp = first_list;
	while (tmp)
    {
        printf("Content: %s\n", (char *)tmp->data);
        tmp = tmp->next;
    }


	return 0;
}



// nasm -f elf64 ft_read.s && \
// nasm -f elf64 ft_write.s && \
// nasm -f elf64 ft_strcpy.s && \
// nasm -f elf64 ft_strcmp.s && \
// nasm -f elf64 ft_strlen.s && \
// nasm -f elf64 ft_strdup.s && \
// nasm -f elf64 ft_lst_new.s && \
// nasm -f elf64 ft_list_push_front.s && \
// nasm -f elf64 ft_atoi_base.s && \
// nasm -f elf64 ft_list_size.s && \
// nasm -f elf64 ft_list_sort.s && \
// nasm -f elf64 ft_list_remove_if.s && \
// nasm -f elf64 ft_remove_data.s && \
// gcc -no-pie main.c ft_read.o ft_write.o ft_strcpy.o ft_strcmp.o ft_strlen.o ft_strdup.o ft_atoi_base.o ft_list_push_front.o ft_lst_new.o ft_list_size.o ft_list_sort.o ft_list_remove_if.o ft_remove_data.o -o test_asm
