#! usr/bin/bash

# SUBWORD. search and replace a word in a file.

# First read the file.

# read from the user with a prompt (-p) 

echo -e 'Please enter the word to target\n' 
read target



echo -e 'Please enter a number\n' 
read number

if [ $number -gt 10 -a  $target = 'amin' ]
then
echo "hooray!! $number is good"
else
echo "boo!! $number  is no good"
fi 







