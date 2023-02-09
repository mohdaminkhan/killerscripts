#!/usr/bin/env bash





# This script is designed to take a json input file and format it into something
# which presents the results in a easily readable, tabulated manner.
# Intention is to use awk, sed and grep  among  other commands to achieve this.

# An input file should be provided and a resultant file  should be output.


# Parameters: Input file, output file, tabulation format.

# tabulation format can be indented or table - output as text or csv.


# Function to check if argument is a file location

checkFile() {
	if [[ ! -f $1 ]]
	then
		printf '%-6s' "this is text"

	else 
		printf "That is a file"
	fi

}
	




# declare variables that may be used throughout
declare OPTIND # This is iterator in getopts
declare isfile=true
declare GREEN="\e[32m"
declare lightGREEN="\e[32m"
declare lightRED="\e[91m"
declare lightYELLOW="\e[93m"
declare YELLOW="\e[33j"
declare ENDCOLOR="\e[0m"
declare inputFile=null
declare outputFile=null
declare format="table"


# get options passed in using getopts
# for 
while getopts "i:o:f:" flags; do 
	case $flags in
		i) checkFile $OPTARGS
			;;
		o) checkFile $OPTARGS
			;;
		f)checkFile $OPTARGS
			;;
		?)checkFile $OPTARGS


	esac

done

printf "The script is finished now \n"
