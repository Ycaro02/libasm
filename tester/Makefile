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

NAME_WRITE		=	libasm_write_test

CC			= 	gcc -Wall -Wextra -Werror -g

MAIN		= 	src/test.c\
				src/test_implementation.c


MAIN_WRITE	= 	src/test_write.c\
				src/test_implementation.c

CHECK_LIB	= 	./script/check_lib.sh

# make re && gcc test.c libasm.a && ./a.out

all:	${NAME}

${NAME}:
		./script/check_lib.sh
		@echo " \033[5;36m ----- Compiling ${NAME} ...  ----- \033[0m"
		cp ../${LIB} .
		${CC} ${MAIN} ${LIB} -o ${NAME} 
		${CC} ${MAIN_WRITE} ${LIB} -o ${NAME_WRITE} 

test:
		./${NAME} 
		./${NAME_WRITE} 2> /dev/null

testv:
		valgrind --leak-check=full ./${NAME}
		valgrind --leak-check=full ./${NAME_WRITE}

gdb:
	gdb ${NAME}

clean:
		@${RM} ${NAME} ${NAME_WRITE}

fclean:	clean
		@${RM} ${NAME} ${LIB} ${NAME_WRITE}

re:		fclean all

.PHONY:		all clean fclean re