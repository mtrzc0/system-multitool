#!/bin/bash

. process.sh
. threads.sh

OPTIONS="Processes Threads Memory I/O Files"

clear

echo "Choose a program to run"
PS3="> "
select option in $OPTIONS
do
    case $REPLY in
        1) process_main ;;
        2) threads_info ;;
        *) exit 0       ;;    
    esac
done
