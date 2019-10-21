#!/bin/bash

# create a dir 201910 if it doesn't exist, then create 100 files in it, named file1 ....file100
dir="201910"
if [ ! -e $dir ]
then
	mkdir $dir
	for i in {1..100}
	do
		touch "$dir/file$i" 
	done
else
	echo "$dir already exists!"
fi
