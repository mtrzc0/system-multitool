#!/bin/bash

function devices_name_size_type_disk ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    lsblk -o NAME,SIZE,TYPE
    echo $COOL_LINES
}

function devices_block_uniq_major_number ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    temp=$(ls -l /dev | grep ^b | tr -s ' ' | cut -d ' ' -f 5 | uniq -cu)
    ls -l /dev | grep ^b | tr -s ' ' | cut -d ' ' -f 5,10 | uniq -c | grep "$temp" | tr -s ' '
    echo $COOL_LINES
}

function devices_name_size_type_main ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    sudo dmidecode --type memory | grep -E 'Size|Type'
    echo $COOL_LINES
}

function devices_char_uniq_major_number ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    temp=$(ls -l /dev | grep ^c | tr -s ' ' | cut -d ' ' -f 5 | uniq -cu)
    ls -l /dev | grep ^c | tr -s ' ' | cut -d ' ' -f 5,10 | uniq -c | grep "$temp" | tr -s ' '
    echo $COOL_LINES
}

function devices_network_controller ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    lspci | grep -i 'network controller'
    echo $COOL_LINES
}

function devices_sockets_list ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    ss -tunl
    echo $COOL_LINES
}

function devices_ports_list ()
{
    # separator
    COOL_LINES="--------------------------------------------------"

    echo $COOL_LINES
    ss -tun
    echo $COOL_LINES
}

function devices_main ()
{
    OPTIONS="devices_name_size_type_disk devices_block_uniq_major_number devices_name_size_type_main devices_char_uniq_major_number devices_network_controller devices_network_controller devices_sockets_list devices_ports_list"

    echo "Which information about memory to display? "
    PS3="> "
    select option in $OPTIONS
    do
        case $REPLY in
            1) devices_name_size_type_disk       ;;
            2) devices_block_uniq_major_number   ;;
            3) devices_name_size_type_main       ;;
            4) devices_char_uniq_major_number    ;;
            5) devices_network_controller        ;;
            6) memory_used_free_partition_disk   ;;
            7) devices_sockets_list              ;;
            8) devices_ports_list                ;;
            *) exit 0                            ;;    
        esac
    done
    exit 0
}
