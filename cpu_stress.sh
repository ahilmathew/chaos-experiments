#!/bin/bash
stress_no_params () {
    echo "Arguments required for cpu stress are - the string 'stress', number of cores to stress"
    echo -e "Example:\n ./cpu_stress.sh stress 2"
}
free_no_params () {
    echo "Arguments required for removing strees are- the string 'free'"
    echo -e "Example:\n ./cpu_stress.sh free"
}
stress () {
    for (( c=1; c<=$1; c++ ))
    do
        `yes > /dev/null &`
    done
}
free () {
    `killall yes`
}
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    stress_no_params
    free_no_params
    elif [ $1 == "stress" ]; then
    if [ -z "$2" ] ; then
        stress_no_params
    else
        echo "Introducing stress on $2 cpu cores"
        stress $2
    fi
    elif [ $1 == "free" ]; then
        echo "Freeing up CPU cores"
        free
else
    echo "Unknown Operation"
    exit 1
fi