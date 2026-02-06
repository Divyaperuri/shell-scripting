 #!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
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
#check the source directory and destination directory are passed or not 
if [ $# -lt 2 ]; then
    USAGE
fi 

#check the Source Directory exist
if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source $SOURCE_DIR does not exist $N"
    exit 1
fi

#check the Destination directory exist
if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination $DEST_DIR does not exist $N"
    exit 1
fi

#Finding the files in Source Directory

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

#Archieving the files to Source dir to Destination dir by ziping the files
if [ ! -z "${FILES}" ] then 
    #Start Archieving
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    echo $FILES | zip -@ -j "$ZIP_FILE_NAME"

    ##Check Archieval Success or not
    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "$G Successfully archieval $N"

    #Delete if success
        while IFS= rad -r filepath
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES_TO_DELETE
    else
        echo -e "$R Archieve... Failure $N"
        exit 1
else
    echo -e "$G No files to archieve.. $N"
fi
