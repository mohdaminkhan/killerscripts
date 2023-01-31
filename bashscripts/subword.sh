#! usr/bin/bash

# SUBWORD. search and replace a word in a file.

# Gather arguments from flags using 'getopts'



# Let's look  at how command line arguments are dealt with in bash.

# Bash collects the strings passed into the  command that executes a command or
# scripts


# getopts is a command that parses short options (with a single dash) can also
# parse short options in combination in. Cannot parse options with long names,
# use 'getopt' instead. 

# $@ stores the arguments in string form, getopts parses that string assigning
# the options to their respective flags.


# Simple echo of getopts

while getopts "t:s:f:" options;do
echo  "$options" 
done

echo $options
#  we want to loop over the files passed in.
#	for passedIn in $@;
#	do
#		echo $passedIn
#		grep Mary $passedIn
#		echo -e "\n"
#	done

