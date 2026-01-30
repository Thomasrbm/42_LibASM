#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

extern int _ft_read(int fd, char *buf, size_t count);
extern int _ft_write(int fd, void *buf, size_t count);
extern char *_ft_strcpy(char *s1, char *s2);
extern int _ft_strcmp(char *s1, char *s2);
extern int _ft_strlen(char *s1);

int main()
{
	int fd = open("to_read.txt", O_RDWR | O_CREAT | O_APPEND, 0644);

	_ft_write(fd, "hello\n", 6);

	lseek(fd, 0, SEEK_SET);

	char *buff = malloc(100);
	int byte = _ft_read(fd, buff, 100);
	printf("byte read = %d | content = \n%s\n", byte, buff);

	char *dest = malloc(100);
	char *src = "hello";
	_ft_strcpy(dest, src);

	printf("cpy dest = %s\n", dest);

	int test = _ft_strcmp(dest, src);
	printf("cmp = %d\n", test);

	printf("dest length = %d\n", _ft_strlen(dest));
	return 0;
}



nasm -f elf64 ft_read.s && \
nasm -f elf64 ft_write.s && \
nasm -f elf64 ft_strcpy.s && \
nasm -f elf64 ft_strcmp.s && \
nasm -f elf64 ft_strlen.s && \
nasm -f elf64 ft_strdup.s && \
gcc -no-pie main.c ft_read.o ft_write.o ft_strcpy.o ft_strcmp.o ft_strlen.o ft_strdup.o -o test_asm
