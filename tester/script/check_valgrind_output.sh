#!/bin/bash

RED="\e[31m"
RESET="\e[0m"
CYAN="\e[36m"

VAL_OUT=valgrind_output

cat ${VAL_OUT} | grep "Invalid" > /dev/null 2> /dev/null;
if [ $? -eq 0 ]; then
	echo -e "${RED}Invalid read/write found $1 $RESET"
else
	echo -e "${CYAN}No invalid read/write found in $1 $RESET"
fi

cat ${VAL_OUT} | grep "Conditional" > /dev/null 2> /dev/null;
if [ $? -eq 0 ]; then
	echo -e "${RED}Conditional jump found $1 $RESET"
else
	echo -e "${CYAN}No Conditional jump found in $1 $RESET"
fi
