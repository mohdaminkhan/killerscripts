#! usr/bin/bash

# SUBWORD. search and replace a word in a file.

# Gather arguments from flags using 'getopts'

options=$@
clear

subwordnow () {
# We have to declare OPTIND locally, to reset this global variable, otherwise
# the index of the loop is kept globally and will always be the end of the array
# after the first run, meaning the script would only work once per session

declare OPTIND

while getopts "t:s:f:" flags;do
	case $flags in
	t) 
	echo "t value is $OPTARG"
	;;
	s) 
	echo "s value is $OPTARG"
	;;
	f) 
	echo "f value is $OPTARG"
	;;
	*) 
	echo "Please supply t,s or f"
	;;
esac
done
echo $options
}
#  we want to loop over the files passed in.
#	for passedIn in $@;
#	do
#		echo $passedIn
#		grep Mary $passedIn
#		echo -e "\n"
#	done
echo "this is passed in... $@"
subwordnow "$@"

