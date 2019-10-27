if [[ -z "$1" ]];then
	echo "You haven't entered any param"
	exit
elif [[ -z "$2" ]];then
	echo "You have entered only one param"
	exit
elif [[ -z "$3" ]];then
	echo "You have entered a third param"
	exit
fi
echo "first param :  $1, third param : $3"
