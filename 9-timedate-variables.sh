#!/bin/bash

#DATE=$(date)

START_TIME=$(date +%s)

sleep 10 #It indicates that execution time to print"

END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in: $TOTAL_TIME seconds"