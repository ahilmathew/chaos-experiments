#!/bin/bash

fill_no_params () {
    echo "For filling up disk, the first parameter should be the string \"fill\", the directory and the percentage value of the disk to be filled."
    echo -e "Example: \n./manage_space.sh fill /partition 80"
}
clean_no_params () {
    echo "For cleaning up, the first parameter should be the string \"cleanup\" and the directory to be cleaned"
    echo -e "Example: \n./manage_space.sh cleanup /partition"
}
fill () {
    DIRECTORY=$1
    TOTAL_SIZE=`df -BG $DIRECTORY  | awk '$NF == "/" { print $4}' | tr -dc '0-9'`

    FILL_PERCENTAGE=$2
    REQUIRED_FILE_SIZE=$(($TOTAL_SIZE * $FILL_PERCENTAGE/100))
    echo "Creating file of size $REQUIRED_FILE_SIZE GB in $DIRECTORY"
    `sudo fallocate -l ${REQUIRED_FILE_SIZE}G ${DIRECTORY}/file`
    exit 0
}
clean () {
    DIRECTORY=$1
    echo "Cleaning $DIRECTORY"
    `sudo rm -rf ${DIRECTORY}/file`
    exit 0
}
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    fill_no_params
    clean_no_params
    elif [ $1 == "fill" ]; then
    if [ -z "$2" ] || [ -z "$3" ]; then
        fill_no_params
    else
        echo "Calling fill $2 with $3"
        fill $2 $3
    fi
    elif [ $1 == 'cleanup' ]; then
    if [ -z "$2" ]; then
        clean_no_params
    else
        echo "Calling clean with $2"
        clean $2
    fi
else
    echo "Unknown Operation"
    exit 1
fi

