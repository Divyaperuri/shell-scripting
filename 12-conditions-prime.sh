#!/bin/bash

echo "Please enter the number:"
read NUMBER
for i in {2..20}
do
if [ $(($NUMBER % $i)) -eq 0 ]; then
    echo "Given number $NUMBER is PRIME"
else
    echo "Given number $NUMBER is NOT PRIME"
fi
done