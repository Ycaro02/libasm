# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ycaro <ycaro@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/13 17:07:10 by ycaro            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIB			= 	libasm.a

NAME		=	libasm_test

CC			= 	gcc -g

MAIN		= 	src/test.c

CHECK_LIB	= 	./script/check_lib.sh

# make re && gcc test.c libasm.a && ./a.out

all:	${NAME}

${NAME}:
		./script/check_lib.sh
		@echo " \033[5;36m ----- Compiling ${NAME} ...  ----- \033[0m"
		cp ../${LIB} .
		${CC} ${MAIN} ${LIB} -o ${NAME} 
		./${NAME}

gdb:
	gdb ${NAME}

clean:
		@${RM} ${NAME}

fclean:	clean
		@${RM} ${NAME} ${LIB}

re:		fclean all

.PHONY:		all clean fclean re