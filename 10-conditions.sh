#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 30 ]; then
    echo "given number $NUMBER is less than 30"
elif [ $NUMBER -gt 30 ]; then
    echo "given number $NUMBER is greater than 30"
else
    echo "given number $NUMBER is equal to 30"
fi

#elif : If multiple if conditions
#lt is less than
#gt is greater than
#et is equal to
