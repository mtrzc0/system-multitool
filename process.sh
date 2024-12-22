#!/bin/bash

function process_info () 
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get number of system processes
    process_count=$(ps -e | tr -s ' ' | cut -d ' ' -f2 | grep -v PID | wc -l)

    # get the biggest process size and name
    size=$(ps -eo size --sort size | tail -1)
    name=$(ps -eo cmd --sort=size | tail -1)

    if [[ size -le 0 ]]; then
        echo "Invald process size"
        exit 3 # ERROR CODE 3 - No such process
    fi

    echo $COOL_LINES
    echo "Number of system processes: $process_count"
    echo $COOL_LINES
    echo "name: $name"
    echo "size: $size KB"
    echo $COOL_LINES
    exit 0 # ERROR CODE 0 - success
}

