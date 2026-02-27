#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THERSHOLD=2 #in project we keep is as 75
IP_ADDRESS=$(curl -s http://100.48.227.197/latest/meta-data/local-ipv4)

while IFS= read -r line
do
    #echo "Line: $Line"
    USAGE=$(echo $line | awk '{Print$6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -ge $DISK_THERSHOLD ]; then 
        MESSAGE+="High Usage on $Partition: $USAGE" % <br>
    fi
done <<< $DISK_USAGE

echo -e "Message Body: $MESSAGE"

sh mail.sh "divyaperuri97@gmail.com" "High Disk Usage Alert" "High DIsk Usage"

TO_ADDRESS=$1
SUBJECT=$2
ALERT_TYPE=$3
MESSAGE_BODY=$4
IP_ADDRESS=$5