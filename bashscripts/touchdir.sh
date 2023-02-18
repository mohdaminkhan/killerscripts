#!/usr/bin/env bash

# make a command that combines mkdir and touch to create a file in a new
# directory

# The input to the command should be the path and file name.
# eg 'touchdir some/path/somefile.txt' 


declare path=$1;

touchdir() {

	if [[ -z $1  ]]
	then 
		echo "please provide a NEW path and file with this command"
	elif [[ -e $1 ]];then
			echo "$1 already exists"
	else
		# now we need to take the string and parse out the piece
		# of text after the last '/', look up ways to do this in
		# bash.
		echo "thank you for providing $1 as the file to create"
	fi 

}
touchdir $@

