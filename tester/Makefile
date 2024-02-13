# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/12 17:52:39 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIB			= 	libasm.a

NAME		=	libasm_test

CC			= 	gcc

MAIN		= 	src/test.c

CHECK_LIB	= 	./script/check_lib.sh

# make re && gcc test.c libasm.a && ./a.out

all:	${NAME}

${NAME}:
		./script/check_lib.sh
		@echo " \033[5;36m ----- Compiling ${NAME} ...  ----- \033[0m"
		cp ../${LIB} .
		gcc ${MAIN} ${LIB} -o ${NAME} 
		./${NAME}

clean:
		@${RM} ${NAME}

fclean:	clean
		@${RM} ${NAME} ${LIB}

re:		fclean all

.PHONY:		all clean fclean re