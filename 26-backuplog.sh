 #!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/app-logs "
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #/var/log/shell-scripting/17-loops.sh
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #If not provides consider the default 14 days

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privilage"
     exit 1 #failure is other than 0
fi 

USAGE(){
    echo -e "USAGE: sudo sh 26-backuplogs.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional], default 14 days"
    exit 1
}  
if [ $# -lt 2 ]; then
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source $SOURCE_DIR does not exist $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination $DEST_DIR does not exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14 +$DAYS)

if [ ! -z "${FILES}" ]; then 
    echo "Files found"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    echo $FILES | zip -@ -j "$ZIP_FILE_NAME"
else
    echo -e "$G No files to archieve.. $N"
fi
