#!/bin/bash

function memory_used_free_main ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    free -h | tr -s ' ' | cut -d ' ' -f2,3
}

function memory_active_main ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    cat /proc/meminfo | grep -E 'Active'
}

function memory_inactive_main ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    cat /proc/meminfo | grep -E 'Inactive'
}

function memory_page_4k_2M_main ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    cat /proc/meminfo | grep -E 'DirectMap4k|DirectMap2M'
}

function memory_used_free_disk ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    df --output='source,avail,used'
}

function memory_used_free_partition_disk ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    lsblk -o NAME,FSSIZE,FSUSED,FSAVAIL --noempty
}

function memory_main ()
{
    OPTIONS="used_free_main active_main inactive_main page_4k_2M_main used_free_disk used_free_partition_disk"

    echo "Which information about memory to display? "
    PS3="> "
    select option in $OPTIONS
    do
        case $REPLY in
            1) memory_used_free_main             ;;
            2) memory_active_main                ;;
            3) memory_inactive_main              ;;
            4) memory_page_4k_2M_main            ;;
            5) memory_used_free_disk             ;;
            6) memory_used_free_partition_disk   ;;
            *) exit 0                            ;;    
        esac
    done
    exit 0
}
