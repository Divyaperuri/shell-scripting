#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "$R ERROR:: Please run this script with root access"
    exit 1 # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "$R ERROR:: Installing MySQL is $R failure"
else
    echo "Installing MYSQL is $G SUCCESS"
fi