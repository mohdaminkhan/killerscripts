FUNCNAME="another word"



myFunc() {
	local someVar="local var"
	looseVar="not local"
	echo $@
	echo "$FUNCNAME"


}

myFunc one two three
echo " funcName ${FUNCNAME}"
echo "local var ${someVar}"
echo "not localised ${looseVar}"

