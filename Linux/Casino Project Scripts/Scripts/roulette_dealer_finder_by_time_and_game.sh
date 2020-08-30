#! /bin/bash
# The purpose of this script is to output a specific dealers name based on time, date, and game input. 
# If I were to name this script myself, I would drop roulette from the name. (just saying)
#When executing script, input must match exact form.

echo -n "Hello. This script will identify which dealer is working which game at which time. [press enter]"
read pressenter
echo -n "What date would you like to check? Please enter four digits MMDD :"
read DATE
# Example, for march 10th, use 0310
echo -n "Which hour of the day would you like to check? Double digit hour please ## :"
read HOUR
#Example, for 5 o'clock, use 05. 12h format
echo -n "Is that AM or PM? :"
read WM
#just be exactly AM or PM
echo -n "Which game would you like to check? Blackjack, Roulette, or TexasHoldem :"
read GAME
#input must match exactly, case sensitive

case $GAME in

	Blackjack)
	  grep "$HOUR:00:00 $WM" $DATE* | awk -F" " '{print $1, $2 $3, $4}'
	  ;;

	Roulette)
	  grep "$HOUR:00:00 $WM" $DATE* | awk -F" " '{print $1, $2, $5, $6}'
	  ;;

	TexasHoldem)
	  grep "$HOUR:00:00 $WM" $DATE* | awk -F" " '{print $1, $2, $7, $8}'
	  ;;

	*)
	  echo -n "Please spell the game exactly as provided. Blackjack, Roulette, or TexasHoldem"
	  ;;
esac

echo -n "Would you like to check another schedule? y/n  :"
read INPUT

case $INPUT in

	y)
	  ./roulette_dealer_finder_by_time_and_game.sh
	  ;;

	*)
	  echo -n "Have a great day!"
	  read pressenter
	  ;;
esac
