
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

extern void ft_write(int fd, char *msg, int nb);

int main()
{
	int fd = open("to_write.txt", O_RDWR | O_CREAT | O_APPEND , 0644);

	ft_write(fd, "hello\n", 6);
	// write(fd, "hello\n", 6);
	printf("errno = %d\n", errno);

	return 0;
}