#!/bin/bash

#while loop will read the files 
#File reading line by line : IFS(Internal field separator)
# count=5
# echo "Starting countdown..."

# while [ $count -gt 0 ]
# do
#     echo "Time left: $count"
#     sleep 1 # pause for 1 second
#     count=$((count -1)) #Decrement the count
# done

# echo "Times up!"

while IFS= read -r line; do

    echo "Processing line: $line"

done < 21-script-1.sh
# Here < symbol indicates the output taking from the file
# <<< symbol indicates the output taking from variable 