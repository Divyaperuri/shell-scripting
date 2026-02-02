#!/bin/bash
#Installing Python and Java
$USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script in root privilage"
    exit 1 #if it is failure
fi

VALIDATE(){ #functions recieve inputes through args just like script args
    if  [ $1 -ne 0 ]; then
        echo "$R ERROR:: Installing $2 is $R Failure"
        exit 1
    else 
        echo "Installing $2 is $G SUCCESS"
    fi
}

dnf install python3 -y
VALIDATE $? "PYTHON3"

dnf install java -y
VALIDATE $? "JAVA"
