#!/bin/bash

if [[ $# -ne 0 ]]; then
	echo "There should not be any parameters."
	exit 1
fi

mkdir access_logs

. ./log_generation.sh
