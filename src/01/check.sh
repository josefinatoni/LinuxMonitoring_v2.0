#!/bin/bash

if [[ $# -ne 6 ]]; then
	echo "There should be six parameters."
	exit 1
fi

if [[ ! -d  $1 ]]; then
	echo "1st parameter should be a directory."
	exit 1
fi

if ! [[ $2 =~ [[:digit:]] ]]; then
	echo -e "2nd parameter should be a number of subfolders.\nPlease enter numbers."
	exit 1
fi

if ! [[ $3 =~ ^[a-zA-Z]{1,7}$ ]]; then 
	echo -e "You either entered something that is not letters\n\tor your input consists of more than 7 signs for folders name.\nPlease check your input for 3rd parameter."
	exit 1
fi

if ! [[ $4 =~ [[:digit:]] ]]; then
	echo -e "4th parameter should be a number of files.\nPlease enter numbers."
	exit 1
fi

if ! [[ $5 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then 
	echo -e "You either entered something that is not letters\n\tor your input consists of more than 7 signs in file name.\nOr You either entered something that is not letters\n\tor your input consists of more than 3 signs in file extension.\nPlease check your input for 5th parameter."
	exit 1
fi

nsize=$6
if ! [[ $6 =~ ^[0-9]+kb$ ]]; then
	if [[ $6 =~ ^[0-9]+$ ]]; then
		echo "You forgot to write \"kb\", but don't worry. I''take care of you;)"
		nsize+="kb"
	else
	echo -e "6th parameter should be the size of files.\nPlease enter numbers."
	exit 1
	fi
fi

digit="${nsize:0:-2}"
if ! (( digit <= 100 )); then
	echo -e "6th parameter should be the size of files not more than 100.\nPlease check your input."
	exit 1
fi