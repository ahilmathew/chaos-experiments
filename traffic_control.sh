#!/bin/bash
start_delay_no_params () {
    echo "Arguments required for introducting delay to an interface are - the string 'start', amount of delay in milliseconds and the interface"
    echo -e "Example:\n ./traffic_control.sh start 20 eth0"
}
stop_delay_no_params () {
    echo "Arguments required for removing delay to an interface are - the string 'stop' and the interface"
    echo -e "Example:\n ./traffic_control.sh stop eth0"
}
install_tc () {
    if ! [ -x "$(command -v tc)" ]; then
        echo 'tc is not installed.' >&2
        echo 'Installing tc'
        echo `sudo yum install tc -y`
    fi
}
start_delay () {
	INTERFACE=$2
	DELAY=$1
    install_tc
    `sudo tc qdisc add dev $INTERFACE root netem delay ${DELAY}ms`
    exit 0
}

stop_delay () {
	INTERFACE=$1
    install_tc
    `sudo tc qdisc del dev $INTERFACE root`
    exit 0
}
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    start_delay_no_params
    stop_delay_no_params
    elif [ $1 == "start" ]; then
    if [ -z "$2" ] || [ -z "$3" ] ; then
        start_delay_no_params
    else
        echo "Delay $3 on $2"
        start_delay $2 $3
    fi
    elif [ $1 == "stop" ]; then
    if [ -z "$2" ]; then
        stop_delay_no_params
    else
        echo "Stop Delay on $2"
        stop_delay $2
    fi
else
    echo "Unknown Operation"
    exit 1
fi