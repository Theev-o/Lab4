#!/bin/bash

VALID_ARGS=$(getopt -o dll:h --long date,logs,logs:,help -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"
while [ : ]
do
    case "${1}" in
        -d | --date) 
            date +%m-%d-%Y
            break
            ;;
        -l | --logs)
            if [ $# -eq 3 ]; then
                    COUNT=$3;
                else
                    COUNT=100;
                fi
            for i in $(seq 1 $COUNT)
                do
                    echo "log$i.txt, $(basename "$0"), $(date +%m-%d-%Y)" >> log$i.txt
              done
              break
              ;;
        -h | --help)
                echo "Usage: -d or --date displays current date. -l or --logs creates specified number of log files, default is 100. -h or --help displays this message"
                break
                ;;
    esac
done