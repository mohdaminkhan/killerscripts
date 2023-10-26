one=$1
two=$2
three=$3

answer=$(echo $one | sed 's/-/ /g')


echo $answer


remove_space=$(echo $2 | sed 's/ /-/g')

echo remove space 
echo $remove_space 


