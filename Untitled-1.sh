#!/bin/bash

VALID_ARGS=$(getopt -o dl --long date,logs -- "$@")
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
            for i in {1..100}
                do
                    echo "log$i.txt, $(basename "$0"), $(date +%m-%d-%Y)" >> log$i.txt
              done
              break
              ;;
    esac
done