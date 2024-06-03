#!/bin/bash

# Check if both input arguments are written

if [ -z "$1" ] || [ -z "$2" ]; then
       echo "One or both arguments are invalid"
       exit 1
fi

dir="$1"
str="$2"
strcount=0
filecount=0

if [ ! -d "$dir" ]; then 
	echo "The value given is not a valid directory"
	exit 1
fi

# filecount=$(find "$dir" -type f | wc -l)


for file in "$dir"/*; do
	if [ -f "$file" ]; then
		# For each valid file - increment the filecount
		((filecount++))
		if grep -q "$str" "$file"; then
			((strcount++))
		fi
	fi
done

echo "The number of files are $filecount and the number of matching lines are $strcount"
