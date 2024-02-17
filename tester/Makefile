# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/15 15:32:30 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIB			= 	libasm.a

NAME		=	libasm_test

NAME_WRITE		=	libasm_write_test

BONUS_NAME		= libasm_bonus_test

MAIN_BONUS		=	src/test_bonus.c\
					src/list.c\
					src/test_implementation.c\
					src/ft_itoa.c\
					src/my_atoi_base.c\

CC			= 	gcc -Wall -Wextra -Werror -g

MAIN		= 	src/test.c\
				src/test_implementation.c


MAIN_WRITE	= 	src/test_write.c\
				src/test_implementation.c

CHECK_LIB	= 	./script/check_lib.sh


VAL_OUT		=	valgrind_output

VAL			=	valgrind --leak-check=full --log-file=${VAL_OUT}

CHECK_VAL_OUT	= script/check_valgrind_output.sh

# Used for write/read test cause invalid syscall write on stderr
REDIR_NULL	= 2> /dev/null

all:	${NAME}

${NAME}:
		./script/check_lib.sh
		@cp ../${LIB} .
		@${CC} ${MAIN} ${LIB} -o ${NAME} 
		@${CC} ${MAIN_WRITE} ${LIB} -o ${NAME_WRITE} 
		@echo "\033[7;32m ----- Compiling ${NAME}     ----- \033[0m"

${BONUS_NAME}:
		@./script/check_lib.sh
		@cp ../${LIB} .
		${CC} ${MAIN_BONUS} ${LIB} -o ${BONUS_NAME} 
		@echo "\033[7;32m ----- Compiling lib bonus test  ----- \033[0m"

test:	${NAME}
		@./${NAME} 
		@./${NAME_WRITE} ${REDIR_NULL}

btest:	${BONUS_NAME}
		@./${BONUS_NAME}

atest:	${NAME} ${BONUS_NAME}
		@./${NAME}
		@./${NAME_WRITE} ${REDIR_NULL}
		@./${BONUS_NAME}

avtest:	${NAME} ${BONUS_NAME}
		@${VAL} ./${NAME} && ${CHECK_VAL_OUT} ${NAME}
		@${VAL} ./${NAME_WRITE} ${REDIR_NULL} && ${CHECK_VAL_OUT} ${NAME_WRITE}
		@${VAL} ./${BONUS_NAME} && ${CHECK_VAL_OUT} ${BONUS_NAME}

vbtest:	${BONUS_NAME}
		${VAL} ./${BONUS_NAME}

gbtest:	${BONUS_NAME}
		gdb ${BONUS_NAME}

vtest:
		${VAL} ./${NAME}
		${VAL} ./${NAME_WRITE}

gdb:
	gdb ${NAME}

clean:
		@${RM} ${NAME} ${NAME_WRITE} ${BONUS_NAME} ${VAL_OUT}

fclean:	clean
		@${RM} ${NAME} ${LIB} ${NAME_WRITE} ${BONUS_NAME} 

re:		fclean all

.PHONY:		all clean fclean re