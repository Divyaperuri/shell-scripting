#!/bin/bash

echo "Please prime numbers from 1 to 20 are:"

for NUMBER in {2..20}
do
    is_prime=1
    for((i=2; i*i<= NUMBER; i++))
    do
    if [ $(($NUMBER % i)) -eq 0 ]; then
        is_prime=0
        break
    fi
    done
      # If the number is prime, print it
    if [ $is_prime -eq 1 ]; then
        echo "$NUMBER"
    fi
done
