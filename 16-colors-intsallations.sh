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

dnf list installed python3
#Install if it is not found
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else 
    echo -e "Python3 already exist .. $Y SKIPPING $N"
fi

dnf list installed java
if [ $? -ne 0 ]; them
    dnf install java -y
    VALIDATE $? "JAVA"
else 
    echo -e "JAVA already exist .. $Y SKIPPING $N"
fi