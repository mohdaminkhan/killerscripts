# parse out the enclosing brackets.

sed  -in  '1,$ s/(^[)(]$)/ /g' $1


