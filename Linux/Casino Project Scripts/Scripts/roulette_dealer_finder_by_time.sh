#! /bin/bash
# This script is design to deliver a specific Roulette dealer based on date and time input.
# This script requires three arguments. date #### Hour # and AM or PM
# example - sh script.sh 0310 5 PM


grep "$2:00:00 $3" $1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'

