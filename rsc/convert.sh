#!/bin/bash

# $1 output	base
# $2 input base
# $3 number to convert

bc <<< "obase=$1;ibase=$2;$3"