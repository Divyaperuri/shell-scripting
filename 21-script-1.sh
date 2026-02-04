#!/bin/bash

NAME=Divya
echo "Devops Course: $NAME"
echo "PID of SCRIPT-1: $$"
#sh 22-script-2.sh
#If we do sh , script-1 will acccess script-2 but 
#script-2 will not access the script-1 env , because both process are different
#If we use source script-2 can access script -1 but need to mention the path
source ./22-script-2.sh