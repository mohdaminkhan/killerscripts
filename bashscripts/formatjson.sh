#!/usr/bin/env bash





# This script is designed to take a json input file and format it into something
# which presents the results in a easily readable, tabulated manner.
# Intention is to use awk, sed and grep  among  other commands to achieve this.

# An input file should be provided and a resultant file  should be output.


# Parameters: Input file, output file, tabulation format.

# tabulation format can be indented or table - output as text or csv.


# Function to check if argument is a file location

checkForFile() {

	if [[ ! -f "$1" ]] 
	then
		printf "There is no file called $1"
	else 
		printf "%s is a file \n" $1
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
declare outputFile="./tabulatedjson.txt"
declare format=null


# function that performs the parsing


tabulateJsonText() {

local output=null;

# Using 'tr' we can easily remove whitespace from our file and
cat $1 | tr -d " \t\n\r" > $output;

cat $output
# this removes the outer brackets that enclose the whole payload.
cat $output | sed -e 's!^\[\(.*\)\]$!\1!gm' > $2
echo "Done"
cat $2
}

# get options passed in using getopts
# for 

formatJson() {

# check if any arguments are passed in 
if [[ $# -eq 0 ]]
then
	>&2 printf "${lightRED} No arguments passed in, please provide arguments
	\n ${ENDCOLOR}"
	exit 2
fi

# create file to print to


# check if any arguments are passed in 
# and then assign them to variables.
while getopts "i:o:f:" flags; do 
	case $flags in
		i) if ( checkForFile $OPTARG ) ;then
		inputFile=$OPTARG
		fi	
			;;
		o) outputFile=$OPTARG 
			;;
		f) format=$OPTARG || "TABULATE" 
			;;
		?) echo "this is not an accepted parameter $OPTARG"

	esac

done


tabulateJsonText $inputeFile $outputFile $format


}
formatJson $@
printf "The script is finished now \n"
