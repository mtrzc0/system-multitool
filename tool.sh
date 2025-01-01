#!/bin/bash

. process.sh
. thread.sh
. memory.sh
#. devices.sh

OPTIONS="Processes Threads Memory I/O"

clear

echo "Choose a program to run"
PS3="> "
select option in $OPTIONS
do
    case $REPLY in
        1) process_main  ;;
        2) thread_main   ;;
        3) memory_main   ;;
        4) devices_main  ;;
        *) exit 0        ;;    
    esac
done
