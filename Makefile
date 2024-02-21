# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/12 16:33:38 by nfour             #+#    #+#              #
#    Updated: 2024/02/17 13:45:00 by nfour            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	=	src/ft_strlen.s\
			src/ft_strcpy.s\
			src/ft_strcmp.s\
			src/ft_write.s\
			src/ft_read.s\
			src/ft_strdup.s\

SRCS_BONUS =	src/ft_strlen.s\
				src/ft_strcpy.s\
				src/ft_strcmp.s\
				src/ft_write.s\
				src/ft_read.s\
				src/ft_strdup.s\
				src/bonus/utils/ft_create_list_node.s\
				src/bonus/ft_list_push_front.s\
				src/bonus/ft_list_size.s\
				src/bonus/ft_list_push_back.s\
				src/bonus/ft_list_sort.s\
				src/bonus/ft_list_remove_if.s\
				src/bonus/utils/ft_char_in_base.s\
				src/bonus/utils/ft_char_to_numb.s\
				src/bonus/utils/ft_is_space.s\
				src/bonus/utils/ft_is_valid_base.s\
				src/bonus/ft_atoi_base.s\


NASM	= 	nasm -f elf64 -ggdb -F dwarf -o 

NAME	= 	libasm.a

BONUS_NAME = libasm_bonus.a

# LINK	= ld -o -z noexecsstack

TEST	=	test

OBJS = $(SRCS:.s=.o)

OBJS_BONUS = $(SRCS_BONUS:.s=.o)

RM	= rm -f

BONUS_DONE = "NO"

RE_BONUS = .bonus_source_change

BONUS_ENV= LIBASM_BONUS

CALL_TESTER	=	make -s -C tester

all:		${NAME}

#nasm -f elf64 -o test.o test.s &&  ld -o test test.o && ./test

%.o : %.s
			@$(NASM) $@ $<
			@touch ${RE_BONUS}

${NAME}:	${OBJS}
			@ echo "\033[7;36m ----- Compiling libasm project  ----- \033[0m"
			@ar rc -s ${NAME} ${OBJS}
			@echo "\033[7;32m ----- Compiling libasm done     ----- \033[0m"
			@${CALL_TESTER}

bonus:	${OBJS_BONUS}
		@[ ! -f ${RE_BONUS} ] || (echo "\033[7;36m ----- Compiling libasm bonus    ----- \033[0m" \
			&& ar rc -s ${NAME} ${OBJS_BONUS} \
			&& echo "\033[7;32m ----- Compiling libasmb done    ----- \033[0m")\
			&& rm -rf ${RE_BONUS}

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
		@${CALL_TESTER} gdb

bg:
		@${CALL_TESTER} gbtest

clean:
			@echo "\033[7;31m\n ----- Cleaning  ${NAME} obj    ----- \033[0m"
			@${RM} ${OBJS} ${OBJS_BONUS}
			@${CALL_TESTER} clean
			@echo "\033[7;33m ----- Cleaning  ${NAME} done   ----- \033[0m"


fclean:		clean
			$(shell unset LIBASM_BONUS)
			@${CALL_TESTER} fclean
			@${RM} ${NAME}
			@${RM} ${TEST}

re:			fclean all

.PHONY:		all clean fclean re bonus