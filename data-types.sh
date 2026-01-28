#1/bin/bash

#Everything in shell is considered as string
NUMBER1=1000
NUMBER2=400
NAME=Devsecops
#Here Name will not considered as datatype

SUM=$(($NUMBER1+$NUMBER2))

echo "Sum is: ${SUM}"

LEADERS=("Divya" "Rahul" "Devi" "Srinu")

echo "All leaders: ${LEADERS[@]}"
echo "All leaders: ${LEADERS[2]}"
#@ indicates the @ , if we want particular name in leaders keep index value 0,1...