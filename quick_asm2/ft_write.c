

#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
	int fd = open("to_write.txt", O_CREAT | O_RDWR | O_APPEND , 0644);
	write(9, "hello\n", 6);

	printf("%d", errno);

	return 0;
}