#!/usr/bin/env bash

# make a command that combines mkdir and touch to create a file in a new
# directory

# The input to the command should be the path and file name.
# eg 'dtouchd some/path/somefile.txt' 


declare uri=$1;
declare path;
declare newFile;
dtouch() { 
	if [[ -z $1  ]]
	then 
		echo "please provide a NEW path and file with this command"
	elif [[ -e $1 ]];then
			echo "$1 already exists"
	else
		# now we need to take the string and parse out the piece
		# of text after the last '/', look up ways to do this in
		# bash.
		path=$(echo "$1" | grep -Po '.*(?=/.*$)')
		echo $path
		newFile=$(echo $1 | awk -F '/' '{print $NF}')
		echo $newFile
	fi 

	if [[ ! -z "$path" && ! -z "$newFile" ]] 
	then
		mkdir -p $path && cd $path && touch $newFile
	else
		echo "some parameters are missing"
	fi

}
dtouch $@

