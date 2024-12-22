#!/bin/bash

function process_info () 
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get number of system processes
    process_count=$(ps -e | tr -s ' ' | cut -d ' ' -f2 | grep -v PID | wc -l)

    # get the biggest process size and name
    size=$(ps -e -o size --sort=size | tr -s ' ' | cut -d ' '  -f1 | sort -g | tail -1)
    name=$(ps -e -o cmd --sort=size | tr -s ' ' | cut -d ' '  -f1 | sort -g | tail -1)

    if [[ size -le 0 ]]; then
        echo "Invald process size"
        exit 3 # ERROR CODE 3 - No such process
    fi

    echo $COOL_LINES
    echo "Number of system processes: $process_count"
    echo "name: $name"
    echo "size: $size KB"
    echo $COOL_LINES
    exit 0 # ERROR CODE 0 - success
}

