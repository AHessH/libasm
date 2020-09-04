# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: froxanne <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 17:48:03 by froxanne          #+#    #+#              #
#    Updated: 2020/09/04 15:16:56 by froxanne         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAIN =	main.c
NAME =	libasm.a
SRCS =	ft_strlen.s \
		ft_write.s \
		ft_read.s
OBJS =	$(SRCS:.s=.o)
COMP_FLAGS = -Wall -Werror -Wextra


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