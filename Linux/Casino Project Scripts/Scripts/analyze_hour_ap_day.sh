#! /bin/bash
# The purpose of this script is to determine names of Roulette  dealers working at specific time and dates, 
# and record the output to a text file. 
# This script requires three arguments. Day Hour ##, AM/PM, and Day ##.
# example - sh script.sh 05 AM 10


grep "$1:00:00 $2" 03$3_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
