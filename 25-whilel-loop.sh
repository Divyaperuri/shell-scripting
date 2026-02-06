#!/bin/bash

#while loop will read the files 

# count=5
# echo "Starting countdown..."

# while [ $count -gt 0 ]
# do
#     echo "Time left: $count"
#     sleep 1 # pause for 1 second
#     count=$((count -1)) #Decrement the count
# done

# echo "Times up!"  

#File reading line by line : IFS(Internal field separator)
while IFS= read -r line; do

    echo "Processing line: $line"

done < 22-script-2.sh
# Here < symbol indicates the output taking from the file
# <<< symbol indicates the output taking from variable 