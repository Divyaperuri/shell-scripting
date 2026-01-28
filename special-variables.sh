#!/bin/bash

# @ , * will take all the variables at a time 
# Space within words consider the one word , want to separate mention in " "
echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name: $0" 
#Will get the file name of that script
echo "Current directory: $PWD"
#will get the present working directory
echo "Who is running this: $USER"
#will get the user details
echo "Home directory of User: $HOME"
