#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "$R ERROR:: Please run this script with root access"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "$R ERROR:: Installing MySQL is $R failure"
else
    echo "Installing MYSQL is $G SUCCESS"
fi