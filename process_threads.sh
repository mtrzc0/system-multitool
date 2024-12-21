#!/bin/bash

# separator
cool_lines="--------------------------------------------------"

# get the biggest process size and name
size=$(ps -e -o size --sort=size | tr -s ' ' | cut -d ' '  -f1 | sort -g | tail -1)
name=$(ps -e -o cmd --sort=size | tr -s ' ' | cut -d ' '  -f1 | sort -g | tail -1)

if [[ size -le 0 ]]; then
    echo "Invald process size"
    exit 1
fi

echo $cool_lines
echo "Numer of system processes: "
echo "The biggest process"
echo "name: $name"
echo "size: $size"
echo $cool_lines

#ps -e -o size,cmd --sort=size | grep ^$size
