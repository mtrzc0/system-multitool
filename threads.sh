#!/bin/bash

function threads_info () 
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get number of system threads 
    threads_count=$(ps H -eo pid | grep -v PID | wc -l)

    # get the biggest process size and name
    threads=$(ps H -eo pid,size,cmd | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f2)
    name=$(ps H -eo pid,size,cmd | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f5)
    size=$(ps H -eo pid,size,cmd | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f4)

    if [[ size -le 0 ]]; then
        echo "Invald process size"
        exit 3 # ERROR CODE 3 - No such process
    fi

    echo $COOL_LINES
    echo "Number of system threads: $threads_count"
    echo "name: $name"
    echo "size: $size KB"
    echo "threads: $threads"
    echo $COOL_LINES
    exit 0 # ERROR CODE 0 - success
}

