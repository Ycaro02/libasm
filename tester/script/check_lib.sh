#!/bin/bash

NAME=../libasm.a

if [ ! -f $NAME ]
then 
    make -s -C ..
fi