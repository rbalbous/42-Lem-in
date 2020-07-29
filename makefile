# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rbalbous <rbalbous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/23 15:23:24 by rbalbous          #+#    #+#              #
#    Updated: 2018/03/01 18:44:28 by rbalbous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = lem-in
CC = gcc
FLAGS = -Wall -Wextra -Werror -g

SRCS =	main.c \
		parser.c \
		algo.c
SRCS_PATH = srcs
OBJ = $(addprefix $(OBJ_PATH)/, $(SRCS:.c=.o))
OBJ_PATH = obj

INCLUDES = includes

LIB_PATH = srcs/libft
LIB = $(LIB_PATH)/libft.a

all :		$(NAME)

$(NAME) :	$(LIB) $(OBJ)
			$(CC) -o $@ $^ $(FLAGS)

$(LIB) :
			make -C $(LIB_PATH)

$(OBJ_PATH)/%.o: $(SRCS_PATH)/%.c $(INCLUDES)/lem-in.h
			@mkdir $(OBJ_PATH) 2> /dev/null || true
			$(CC) -o $@ -c $< -I $(INCLUDES) -I $(LIB_PATH)/includes $(FLAGS)

clean :
			make -C $(LIB_PATH) clean
			rm -f $(OBJ)

fclean :	clean
			rm -f $(NAME)
			rm -f $(LIB)

re : fclean all

.PHONY : all clean fclean re
