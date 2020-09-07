#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#define CMP_STRLEN(str) (ft_strlen(str) != strlen(str))

#define FAIL_STRLEN(str) \
	{printf("Failed in %s\n", str);\
		return (0);}

int				ft_write(int, char *, int);
unsigned int	ft_strlen(char const *);
int				ft_read(int, char *, int);
int				ft_strcmp(char *, char *);

int		check_strlen()
{
	if (CMP_STRLEN("hello"))
		FAIL_STRLEN("hello");
	if (CMP_STRLEN(""))
		FAIL_STRLEN("");
	if (CMP_STRLEN("asdfasdfasdfasdfasdfasdfasdf"))
		FAIL_STRLEN("asdfasdfasdfasdfasdfasdfasdf");
	if (CMP_STRLEN("42"))
		FAIL_STRLEN("42");
	return (1);
}

int		main(void)
{
	if (check_strlen())
		printf("STRLEN is OK\n");
	
	printf("ret_value is %d std is %d\n", ft_strcmp("ma", "me"), strcmp("ml", "me"));
	// int len = ft_write(1, "111", 3);
	// printf(" ftlen = %d\n", len);
	// len = write(1, "111", 3);
	// printf(" stdlen = %d\n", len);
	// char str[10];
	// int len = ft_read(10, str, 5);
	// str[len] = 0;
	// printf("error = %s %d\n", strerror(errno), errno);
	// printf("len = %d str = |%s|\n", len, str);
	return (0);
}