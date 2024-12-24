#!/bin/bash

function process_get ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    read -p "Name of the process: " name

    echo $COOL_LINES
    pid=$(ps -eo pid,comm --sort=size | grep $name | tail -1 | tr -s ' ' | cut -d ' ' -f2)
    cat /proc/$pid/status 2>/dev/null > temp
    get_pid=$(cat ./temp | grep ^Pid)
    echo $get_pid
    get_vmsize=$(cat ./temp | grep ^VmSize)
    echo $get_vmsize
    get_vmrss=$(cat ./temp | grep ^VmRSS)
    echo $get_vmrss
    get_threads=$(cat ./temp | grep ^Threads)
    echo $get_threads
    get_voluntary_ctxt_switches=$(cat ./temp | grep ^voluntary_ctxt_switches)
    echo "$get_voluntary_ctxt_switches"
    get_nonvoluntary_ctxt_switches=$(cat ./temp | grep ^nonvoluntary_ctxt_switches)
    echo $get_nonvoluntary_ctxt_switches
    echo $COOL_LINES
    rm ./temp
    
    exit 0 # ERROR CODE 0 - success
}

function process_count ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get number of system processes
    process_count=$(ps -e | tr -s ' ' | cut -d ' ' -f2 | grep -v PID | wc -l)
    echo $COOL_LINES
    echo "Number of system processes: $process_count"
    echo $COOL_LINES

    exit 0 # ERROR CODE 0 - success
}


function process_big () 
{
    # separator
    COOL_LINES="--------------------------------------------------"

    # get the biggest process size and name
    name=$(ps -eo comm --sort=size | tail -1 | tr -s ' ' | cut -d ' ' -f1)
    pid=$(ps -eo pid --sort=size | tail -1 | tr -s ' ' | cut -d ' ' -f2)
    size=$(ps -eo size --sort=size | tail -1 | tr -s ' ' | cut -d ' ' -f1)
    class=$(ps -eo cls --sort=size | tail -1 | tr -s ' ' | cut -d ' ' -f2)
    priority=$(ps -eo priority --sort=size | tail -1 | tr -s ' ' | cut -d ' ' -f2)
    children=$(pgrep --parent $pid | wc -l)
    files_open=$(lsof -p $pid | wc -l)

    if [[ size -le 0 ]]; then
        echo "Invald process size"
        exit 3 # ERROR CODE 3 - No such process
    fi

    echo $COOL_LINES
    echo "name: $name"
    echo "pid: $pid"
    echo "size: $size KB"
    echo "planning class: $class"
    echo "priority: $priority"
    echo "children: $children"
    echo "files open: $files_open"
    #ls -l "/proc/$pid/status"
    echo $COOL_LINES

    exit 0 # ERROR CODE 0 - success
}

function process_main ()
{
    OPTIONS="Count Biggest Custom"

    echo "Which information about process to display? "
    PS3="> "
    select option in $OPTIONS
    do
        case $REPLY in
            1) process_count    ;;
            2) process_big      ;;
            3) process_get      ;;
            *) exit 0           ;;    
        esac
    done
}
