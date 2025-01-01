#!/bin/bash

function thread_count ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get number of system threads 
    threads_count=$(ps H -eo pid | grep -v PID | wc -l)

    echo $COOL_LINES
    echo "Number of system threads: $threads_count"
    echo $COOL_LINES

    exit 0 # ERROR CODE 0 - success

}

function thread_big () 
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get the biggest process size and name
    name=$(ps H -eo pid,size,comm | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f5)
    size=$(ps H -eo pid,size | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f4)
    class=$(ps H -eo pid,size,cls | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f5)
    priority=$(ps H -eo pid,size,priority | uniq -c | sort -n | tail -1 | tr -s ' ' | cut -d ' ' -f5)

    if [[ size -le 0 ]]; then
        echo "Invald process size"
        exit 3 # ERROR CODE 3 - No such process
    fi

    echo $COOL_LINES
    echo "name: $name"
    echo "size: $size KB"
    echo "planning class: $class"
    echo "priority: $priority"
    echo $COOL_LINES
    exit 0 # ERROR CODE 0 - success
}

function thread_main ()
{
    OPTIONS="Count Biggest"

    echo "Which information about threads to display? "
    PS3="> "
    select option in $OPTIONS
    do
        case $REPLY in
            1) thread_count    ;;
            2) thread_big      ;;
            *) exit 0          ;;    
        esac
    done
}
