# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/16 14:03:18 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NASM	= 	nasm -f elf64 -o

SRCS	=	src/ft_strlen.s\
			src/ft_strcpy.s\
			src/ft_strcmp.s\
			src/ft_write.s\
			src/ft_read.s\
			src/ft_strdup.s\
			src/ft_list_push_front.s\
			src/ft_list_size.s\
			src/ft_list_push_back.s\
			src/ft_list_sort.s\
			src/ft_list_remove_if.s\

NAME	= 	libasm.a

GDB_RULE	= make -C tester gdb

LINK	= ld -o

TEST	=	test

OBJS = $(SRCS:.s=.o)

RM	= rm -f

# MAIN	= 	tester/src/main_test.c

CALL_TESTER	=	make -s -C tester

all:		${NAME}

#nasm -f elf64 -o test.o test.s &&  ld -o test test.o && ./test

%.o : %.s
			@$(NASM) $@ $<

${NAME}:	$(OBJS)
			@ echo "\033[7;36m ----- Compiling libasm project  ----- \033[0m"
			@ar rc -s $(NAME) $(OBJS)
			@echo "\033[7;32m ----- Compiling libasm done     ----- \033[0m"
			@${CALL_TESTER}
# @ranlib $(NAME) || ar -s $(NAME)

a:
		@${CALL_TESTER} atest

av:
		@${CALL_TESTER} avtest

test:
		@${CALL_TESTER} test


btest:
		@${CALL_TESTER} btest


vbtest:
		@${CALL_TESTER} vbtest


vtest:
		@${CALL_TESTER} vtest

g:
		${GDB_RULE}

clean:
			@echo "\033[7;31m\n ----- Cleaning  ${NAME} obj    ----- \033[0m"
			@${RM} ${OBJS}
			@${CALL_TESTER} clean
			@echo "\033[7;33m ----- Cleaning  ${NAME} done   ----- \033[0m"


fclean:		clean
			@${CALL_TESTER} fclean
			@${RM} ${NAME}
			@${RM} ${TEST}

re:			fclean all

.PHONY:		all clean fclean re bonus