#include <stdio.h>

int		ft_write(int fd, char *buf, int buf_size);
int		ft_strlen(char *str);

int		main(void)
{
	int len = 0;
	char *str = "hello";

	len = ft_strlen("hello");
	printf("len = %d\n", len);
	// ft_write(1, str, 5);
	return (0);
}