# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/15 14:06:03 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIB			= 	libasm.a

NAME		=	libasm_test

NAME_WRITE		=	libasm_write_test

BONUS_NAME		= libasm_bonus_test

MAIN_BONUS		=	src/test_bonus.c\
					src/list.c\
					src/my_atoi_base.c\
					src/test_implementation.c\

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
		@cp ../${LIB} .
		@${CC} ${MAIN} ${LIB} -o ${NAME} 
		@${CC} ${MAIN_WRITE} ${LIB} -o ${NAME_WRITE} 
		@echo "\033[7;32m -----  Compiling ${NAME} done  ----- \033[0m"

${BONUS_NAME}:
		@./script/check_lib.sh
		@echo " \033[5;36m ----- Compiling ${BONUS_NAME} ...  ----- \033[0m"
		@cp ../${LIB} .
		${CC} ${MAIN_BONUS} ${LIB} -o ${BONUS_NAME} 
		@echo "\033[7;32m -----  Compiling ${BONUS_NAME} done  ----- \033[0m"

test:	${NAME}
		@./${NAME} 
		@./${NAME_WRITE} 2> /dev/null

btest:	${BONUS_NAME}
		@./${BONUS_NAME}


gbtest:	${BONUS_NAME}
		gdb ${BONUS_NAME}

vtest:
		valgrind --leak-check=full ./${NAME}
		valgrind --leak-check=full ./${NAME_WRITE}

gdb:
	gdb ${NAME}

clean:
		@${RM} ${NAME} ${NAME_WRITE} ${BONUS_NAME}

fclean:	clean
		@${RM} ${NAME} ${LIB} ${NAME_WRITE} ${BONUS_NAME}

re:		fclean all

.PHONY:		all clean fclean re