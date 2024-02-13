#!/bin/bash

# Color definition
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"


# Set the appropriate value to the time command
TIME="/usr/bin/time"

if [ ! -f /usr/bin/time ]
then
TIME="/bin/time"
fi

REAL="./real/"
ME="./me/"

LIBFT_TEST="libft_malloc_test"

REAL_TEST="malloc_test"

NULL="/dev/null"

make -s -C .. > ${NULL}
mkdir -p .tmp

"${TIME}" -v ./${REAL_TEST} ${1} 2> .tmp/out_real${1}
"${TIME}" -v ./${LIBFT_TEST} ${2} 2> .tmp/out_libft${2}

# echo -e "${RED}Diff ${RESET}"
# diff .tmp/out_real${1} .tmp/out_libft${2} 2> .tmp/diff_out
# cat .tmp/diff_out

echo -e "${GREEN}Page for real malloc  :${RESET}"
REAL_MALLOC_PAGE=$(cat .tmp/out_real${1} | grep Minor | rev | cut -d ' ' -f 1  | rev)
echo -e "${REAL_MALLOC_PAGE}"

echo -e "${CYAN}Page for libft malloc :${RESET}"
LIB_MALLOC_PAGE=$(cat .tmp/out_libft${2} | grep Minor | rev | cut -d ' ' -f 1  | rev)
echo -e "${LIB_MALLOC_PAGE}"

rm -rf .tmp 