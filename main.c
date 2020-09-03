
int		write(int fd, char *buf, int buf_size);

int		main(void)
{
	char *str = "hello";
	write(1, str, 5);
	return (0);
}