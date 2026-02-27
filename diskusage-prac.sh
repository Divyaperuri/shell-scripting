#!/bin/bash   #--> bin/bash means path of bash shell
df -h | awk 'NR>1 && int($5) > 75 {print $6 "is" $5 "full"}'

# NR>1 means skip the first line (the header)
# $5 means column 5 is the use% (eg:85%)
# int($5) means removes the % sign and converts to integer(number)
# > 80 means check thershold value is more than 80%
# print $6 is $5 full --> print mount point and usage