# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: froxanne <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 17:48:03 by froxanne          #+#    #+#              #
#    Updated: 2020/09/03 18:09:26 by froxanne         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAIN = main.c
NAME = libasm.a
SRCS = ft_write.s
OBJS = $(SRCS:.s=.o)


%.o:%.s
	nasm -f macho64 $<

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $?

test:
	gcc -Wall -Werror -Wextra -L. -lasm $(MAIN)

clean:
	rm -rf *.o

fclean: clean
	rm -rf *.a
	rm -rf ./a.out

re: fclean all