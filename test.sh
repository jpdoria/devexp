#!/bin/bash
#
# check if the results.txt with file paths exists first
# if it doesn't, then this script will exit
# else, this will check if the file paths exists and if
# they are symbolic links
#
if [ ! -f results.txt ]; then
    echo "Nothing to test here."
    exit 1
else
    FILES=$(awk '{print $1}' results.txt | sed "s/'//g")
    for X in $FILES; do
        if [[ -f "$X" && -L "$X" ]]; then
            echo "$X is a symlink."
        else
            echo "$X not found."
        fi
    done
fi