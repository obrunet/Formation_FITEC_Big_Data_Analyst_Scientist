#!/bin/bash

if [ $1 = "BRUNO" ]
then
	echo "Same name"
else
	echo "Not the same name"
fi

#fitec@fitec-ThinkPad-P52s:~/Bureau/Code/03.Unix$ bash ./exercice5.sh BRUNO
#>Same name
#fitec@fitec-ThinkPad-P52s:~/Bureau/Code/03.Unix$ bash ./exercice5.sh Bruno
#>Not the same name
#fitec@fitec-ThinkPad-P52s:~/Bureau/Code/03.Unix$ bash ./exercice5.sh sdfds
#>Not the same name