#!/bin/bash

VALID_ARGS=$(getopt -o d --long date -- "$@")
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
    esac
done