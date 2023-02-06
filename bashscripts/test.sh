doawk(){ 
while read  $1
do
	awk '{ print $1}' $1
done
}
doawk $1
