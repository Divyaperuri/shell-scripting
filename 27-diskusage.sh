#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THERSHOLD=2
while IFS= read -r line
do
    echo "Line: $Line"
    USAGE=$(echo $line | awk '{Print$6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -ge $DISK_THERSHOLD ]; then 
        echo "High Usage on $Partition: $USAGE"
    fi
done <<< $DISK_USAGE