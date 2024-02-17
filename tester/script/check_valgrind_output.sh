#!/bin/bash

RED="\e[31m"
RESET="\e[0m"
CYAN="\e[36m"

VAL_OUT=valgrind_output

CHECK_LEAK="All heap blocks were freed -- no leaks are possible"

# maybe we can mute else and just display error

cat ${VAL_OUT} | grep "Invalid" > /dev/null 2> /dev/null;
if [ $? -eq 0 ]; then
	echo -e "${RED}Invalid read/write found in $1 $RESET"
else
	echo -e "${CYAN}No invalid read/write found in $1 $RESET"
fi

cat ${VAL_OUT} | grep "Conditional" > /dev/null 2> /dev/null;
if [ $? -eq 0 ]; then
	echo -e "${RED}Conditional jump found in $1 $RESET"
else
	echo -e "${CYAN}No Conditional jump found in $1 $RESET"
fi

cat ${VAL_OUT} | grep ${CHECK_LEAK} > /dev/null 2> /dev/null;
if [ $? -eq 0 ]; then
	echo -e "${RED}Leak found in $1 $RESET"
else
	echo -e "${CYAN}No leak found in $1 $RESET"
fi
