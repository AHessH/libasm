# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: froxanne <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 17:48:03 by froxanne          #+#    #+#              #
#    Updated: 2020/09/07 21:00:48 by froxanne         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAIN =	main.c
NAME =	libasm.a
SRCS =	ft_strlen.s \
		ft_write.s \
		ft_read.s \
		ft_strcmp.s
OBJS =	$(SRCS:.s=.o)
COMP_FLAGS = -Wall -Werror -Wextra -g


%.o:%.s
	@nasm -f elf64 $<

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $(NAME) $?
	@ranlib $(NAME)

test:
	@gcc $(COMP_FLAGS) $(MAIN) -L. -lasm
	./a.out

clean:
	@rm -rf *.o

clean_test:
	@rm -rf ./a.out

fclean: clean clean_test
	@rm -rf *.a

re: fclean all

retest: fclean all test