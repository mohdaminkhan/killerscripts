#! bin/awk -f 

myresut=$(echo $1 | awk '{for(i=1;i<NF;i++)$i=toupper(substr($i,1,1))
substr($i,2)}1' | tr -d ' ')

echo $myresult









