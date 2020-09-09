#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <time.h>

int				ft_write(int, char *, int);
unsigned int	ft_strlen(char const *);
int				ft_read(int, char *, int);
int				ft_strcmp(char *, char *);
char			*ft_strcpy(char *, const char *);
char			*ft_strdup(char *);


#define CHECK_STRLEN(str) (ft_strlen(str) != strlen(str))
#define FAIL_STRLEN(str) \
	{printf("ft_strlen: Failed in %s\n", str);\
		return (0);}

#define CHECK_STRCMP(str1, str2) (ft_strcmp(str1, str2) != strcmp(str1, str2))
#define FAIL_STRCMP(str1, str2) \
	{printf("ft_strcmp: Failed in %s - %s\n", str1, str2);\
		return (0);}

#define CHECK_STRCPY(str, tmp) (ft_strcmp((str), ft_strcpy(tmp, str)))
#define FAIL_STRCPY(str) \
	{printf("ft_strcmp: Failed in %s\n", str);\
		return (0);}


int		check_strlen()
{
	if (CHECK_STRLEN("hello"))
		FAIL_STRLEN("hello");
	if (CHECK_STRLEN(""))
		FAIL_STRLEN("empty str");
	if (CHECK_STRLEN("asdfasdfasdfasdfasdfasdfasdf"))
		FAIL_STRLEN("asdfasdfasdfasdfasdfasdfasdf");
	if (CHECK_STRLEN("42"))
		FAIL_STRLEN("42");
	return (1);
}

int		check_strcmp()
{
	if (CHECK_STRCMP("hello", "hello"))
		FAIL_STRCMP("hello", "hello");
	if (CHECK_STRCMP("", ""))
		FAIL_STRCMP("", "")
	if (CHECK_STRCMP("hel", "hal"))
		FAIL_STRCMP("hel", "hal");
	if (CHECK_STRCMP("42", "32"))
		FAIL_STRCMP("42", "32");
	if (CHECK_STRCMP("", "hal"))
		FAIL_STRCMP("", "hal");
	if (CHECK_STRCMP("hal", ""))
		FAIL_STRCMP("hal", "");
	if (CHECK_STRCMP("32", "42"))
		FAIL_STRCMP("32", "42");
	return (1);
}

int		check_strcpy()
{
	char *buf = malloc(100);

	if (CHECK_STRCPY("", buf))
		FAIL_STRCPY("");
	if (CHECK_STRCPY("42", buf))
		FAIL_STRCPY("42");
	if (CHECK_STRCPY("lolo", buf))
		FAIL_STRCPY("lolo");
	if (CHECK_STRCPY("asdfasdfasdfasdf", buf))
		FAIL_STRCPY("asdfasdfasdfasdf");
	if (CHECK_STRCPY("112222", buf))
		FAIL_STRCPY("112222");
	return (1);
}

int		check_write()
{
	int fd = open("test.txt", O_RDWR|O_CREAT);
	if (ft_write(1, "111\n", 4) != (int)ft_strlen("111\n"))
		printf("Len is not equal 4 str = 111\n");
	if (ft_write(fd, "hello", 5) != (int)ft_strlen("hello"))
		printf("Len is not equal 5 str = hello\n");
	printf("Check wrong file descriptor:\n");
	errno = 0;
	ft_write(100, "ll", 2);
	printf("errno %d error message is: %s\n", errno, strerror(errno));
	close(fd);
	return (1);
}

int		check_read()
{
	int fd = open("test.txt", O_RDONLY);
	char buf[100];
	int ret_value;
	ret_value = ft_read(fd, buf, 20);
	buf[ret_value] = 0;
	printf("Read str= %s, ret val = %d\n", buf, ret_value);
	printf("Enter string:\n");
	ret_value = ft_read(0, buf, 100);
	buf[ret_value] = 0;
	printf("\nYour string= %s, ret val = %d\n", buf, ret_value);
	return (1);
}

int		check_strdup()
{
	char *str = "hello";
	char *new_str;
	
	printf("CHECK STRDUP:\n");
	if ((new_str = ft_strdup(str)))
		printf("new str = %s\n", new_str);
	new_str[2] = 'a';
	printf("str = %s, new_str = %s\n", str, new_str);
	free(new_str);
	str = NULL;
	new_str = ft_strdup(str);
	printf("str = %s, new_str = %s\n", str, new_str);
	free(new_str);
	str = "";
	new_str = ft_strdup(str);
	printf("str = %s, new_str = %s\n", str, new_str);
	free(new_str);
	str = "asdfasdfasdfasdfasdklgfjasdkljflasjdflkjnaskljdfhkajsdhflkjashdkjflhasljkdhflkjashdkjfhasdljkfh";
	new_str = ft_strdup(str);
	printf("str = %s, new_str = %s\n", str, new_str);
	free(new_str);
	return (1);
}

int		main(void)
{

	if (check_strlen())
		printf("STRLEN is OK\n");

	if (check_strcmp())
		printf("STRCMP is OK\n");
	
	if (check_strcpy())
		printf("STRCPY is OK\n");
	
	if (check_write())
		printf("WRITE is OK\n");

	if (check_read())
		printf("READ is OK\n");

	check_strdup();
	return (0);
}