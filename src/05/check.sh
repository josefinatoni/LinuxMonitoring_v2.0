#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "There should be one parameter."
	exit 1
fi

if ! [[ $1 =~ [[:digit:]] ]]; then
	echo -e "Parameter should be a number.\nPlease, enter a number."
	exit 1
fi

if ! [[ $1 -eq 1 || $1 -eq 2 || $1 -eq 3 || $1 -eq 4 ]]; then
	echo -e "Parameter should be equal 1, 2, 3 or 4."
	exit 1
fi
