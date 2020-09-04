# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: froxanne <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 17:48:03 by froxanne          #+#    #+#              #
#    Updated: 2020/09/03 21:34:08 by froxanne         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAIN = main.c
NAME = libasm.a
SRCS =	ft_write.s \
		ft_strlen.s
OBJS = $(SRCS:.s=.o)
COMP_FLAGS = -Wall -Werror -Wextra


%.o:%.s
	nasm -felf64 $<

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $?

tests:
	gcc -L. -lasm $(MAIN) -o test.out

clean:
	rm -rf *.o

fclean: clean
	rm -rf *.a
	rm -rf ./a.out

re: fclean all