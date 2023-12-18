#!/bin/bash

if [[ $# -ne 3 ]]; then
	echo "There should be three parameters."
	exit 1
fi


if ! [[ $1 =~ ^[a-zA-Z]{1,7}$ ]]; then 
	echo -e "You either entered something that is not letters\n\tor your input consists of more than 7 signs for folders name.\nPlease check your input for 1st parameter."
	exit 1
fi

if ! [[ $2 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then 
	echo -e "You either entered something that is not letters\n\tor your input consists of more than 7 signs in file name.\nOr You either entered something that is not letters\n\tor your input consists of more than 3 signs in file extension.\nPlease check your input for 2nd parameter."
	exit 1
fi

nsize=$3
if ! [[ $3 =~ ^[0-9]+Mb$ ]]; then
	if [[ $3 =~ ^[0-9]+$ ]]; then
		echo "You forgot to write \"Mb\", but don't worry. I''take care of you;)"
		nsize+="Mb"
	else
	echo "3rd parameter should be the size of files.\nPlease enter numbers."
	exit 1
	fi
fi

digit="${nsize:0:-2}"
if ! (( digit <= 100 )); then
	echo -e "3rd parameter should be the size of files not more than 100.\nPlease check your input."
	exit 1
fi