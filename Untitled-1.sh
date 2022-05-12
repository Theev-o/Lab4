#!/bin/bash

VALID_ARGS=$(getopt -o dll:hee: --long date,logs,logs:,help,init,error,error: -- "$@")
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
                    echo "log$i.txt, $(basename "$0"), $(date +%m-%d-%Y)" >> ./log$i/log$i.txt
              done
              break
              ;;
        -h | --help)
            echo "Usage:-d or --date displays current date. -l or --logs creates specified number of log files, default is 100, -e or --error creates specified amount of error files, default is 100. --init clones the repository and adds this script to system PATH. -h or --help displays this message."
            break
            ;;
        --init)
        git clone https://github.com/Theev-o/Lab4.git ./
        export PATH=$PATH:$(dirname -- "$(readlink -f "${BASH_SOURCE}")")
        break
        ;;
        -e | --error)
            if [ $# -eq 3 ]; then
                    COUNT=$3;
                else
                    COUNT=100;
                fi
            for i in $(seq 1 $COUNT)
                do
                    echo "error$i.txt, $(basename "$0"), $(date +%m-%d-%Y)" >> ./error$i/error$i.txt
              done
              break
              ;;
    esac
done