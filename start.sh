#!/bin/bash
DIR=$1

usage() {
    echo "$0 <path/to/directory>"
    echo "Example: $0 /home/brucewayne"
}

#
# display usage if the argument is null
#
if [ -z "$DIR" ]; then
    usage
    exit 1
fi

#
# return error if *.s files do not exist
#
if ! ls "$DIR"/*s > /dev/null 2>&1; then
    echo '"*.s" files not found.'
    exit 2
fi

#
# create a symlink
#
for X in "$DIR"/*.s; do
    ln -sv "$(basename "$X")" "${X/.s/.t}" | tee -a results.txt
done
