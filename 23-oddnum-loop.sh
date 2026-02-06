#!/bin/bash

# Loop from 1 to 99, incrementing by 2
for i in {1..99}; 
do
    # Check if the number is odd using the modulo operator
    if [ $((i % 2)) -eq 1 ]; then
        echo "print the odd numbers from 1 to 99: $i"
    fi
done