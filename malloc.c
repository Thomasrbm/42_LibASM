#include <stdlib.h>
#include <errno.h>
#include <stdio.h>


int main() {
    size_t overflow = -1;
    char *str = malloc(overflow); 
	printf("\n\nerrno = %d\n\n", errno);
    return (str == NULL);
}



https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/errnos/