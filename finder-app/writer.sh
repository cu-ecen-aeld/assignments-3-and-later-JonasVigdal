#!/bin/bash

# Thanks to bashBedlam: https://unix.stackexchange.com/questions/305844/how-to-create-a-file-and-parent-directories-in-one-command 

filepath=$1
writestr=$2

if [ -z "$filepath" ] || [ -z "$writestr" ]; then
    echo "One or both arguements are emtpy"
    exit 1
fi


if [ ! -f "$filepath" ]; then
    # Filepath does not exist -> Create it
    mkdir -p "${filepath%/*}" 
    if [ $? -eq 1 ]; then
        echo "Path could not be created"
        exit 1
    else
        touch -f "$filepath" > /dev/null
        if [ $? -eq 1 ]; then
            echo "File could not be created"
            exit 1
        fi
    fi
fi

echo "$writestr" > $filepath
echo "File created"