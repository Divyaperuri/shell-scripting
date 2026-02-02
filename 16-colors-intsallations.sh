#!/bin/bash\
#Installing Python and Java
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script in root privilage"
    exit 1 #if it is failure
fi

VALIDATE(){ #functions recieve inputes through args just like script args
    if  [ $1 -ne 0 ]; then
        echo -e "$R ERROR:: Installing $2 is $R Failure $N"
        exit 1
    else 
        echo "Installing $2 is $G SUCCESS $N"
    fi
}

dnf list installed python3
#Install if it is not found
if [ $? -ne 0 ]; then 
    echo "Python3 not installed ..Installing $N"
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else 
    echo -e "Python3 already exist .. $Y SKIPPING $N"
fi

dnf list installed java
if [ $? -ne 0 ]; then
    echo "JAVA $R not installed ..Installing $N"
    dnf install java -y
    VALIDATE $? "JAVA"
else 
    echo -e "JAVA already exist .. $Y SKIPPING $N" 
fi