#!/usr/bin/env bash

# SUBWORD. search and replace a word in a file.

# Gather arguments from flags using 'getopts'

options=$@
clear

swapWord () {
# We have to declare OPTIND locally, to reset this global variable, otherwise
# the index of the loop is kept globally and will always be the end of the array
# after the first run, meaning the script would only work once per session

declare OPTIND
declare isfile=true
declare GREEN="\e[32m"
declare lightGREEN="\e[32m"
declare lightRED="\e[91m"
declare lightYELLOW="\e[93m"
declare YELLOW="\e[33j"
declare ENDCOLOR="\e[0m"

while getopts "t:s:f:" flags;do
	case $flags in
	t) 
	echo -e "$lightGREEN word to replace $OPTARG $ENDCOLOR"
	targetWord=$OPTARG
	;;
	s) 
	echo -e "$YELLOW  replcement word is $OPTARG $ENDCOLOR"
	substituteWord=$OPTARG
	;;
	f) 
	echo -e "$lightYELLOW file to operate on $OPTARG $ENDCOLOR"
	fileToCheck=$(readlink -f $OPTARG)
	isfile=true
	if [[ ! -e $fileToCheck ]]; then
		
		echo -e "$fileToCheck does not
		exist.\n Please enter a existing file"
		isfile=false
	fi
	;;
?|!s|!f|!t) 
	echo -e "Please supply t,s or f"
	;;
esac

echo  -e "\n"
done
echo -e 
# echo -e $fileToCheck
# echo -e $(grep $targetWord $fileToCheck)

if ($isfile)
	then
		sed -i.bak s/$targetWord/$substituteWord/g $fileToCheck
		echo -e "$GREEEN original file saved in bak extention
$ENDCOLOR" ;

	else 
		isfile=0
		echo -e "${lightRED} You did not enter a file ${ENDCOLOR}"
fi
}

swapWord "$@" 

