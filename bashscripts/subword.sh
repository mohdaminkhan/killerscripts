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
declare nofile=0
while getopts "t:s:f:" flags;do
	case $flags in
	t) 
	echo "t value is $OPTARG"
	targetWord=$OPTARG
	;;
	s) 
	echo "s value is $OPTARG"
	substituteWord=$OPTARG
	;;
	f) 
	echo "f value is $OPTARG"
	fileToCheck=$(readlink -f $OPTARG)
	if [[ ! -e $fileToCheck ]]; then
		
		echo -e "$fileToCheck does not
		exist.\n Please enter a existing file"
		nofile=1
	fi
	;;
	?) 
	echo "Please supply t,s or f"
	;;
esac

echo -e "\n"
done
echo 
# echo $fileToCheck
# echo $(grep $targetWord $fileToCheck)

if ((!$nofile))
	then
		sed -i.bak s/$targetWord/$substituteWord/g $fileToCheck
fi
}

swapWord "$@"

