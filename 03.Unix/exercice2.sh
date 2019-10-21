#!/bin/bash
read -p 'Please enter 3 words: ' w1 w2 w3


# $# returns the param nb of the script not of function read
if [ "$#" -lt 3 ]; then
	echo "No param given to the script"
	echo "$#"
fi


# if [ test -z "$w3" ] similar to the following condion
if [ "$w3" ]; then
	echo "$w1 $w3"
	exit
else
	echo "No third param !"
fi
