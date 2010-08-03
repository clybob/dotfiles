#!/bin/sh

# Program: find-file.sh
# Version: 0.1
# Date: 2010-08-02
# Author: Enrico <rico.bl@gmail.com>
# Notes: Recursivelly search for files following pattern.
# Usage:
# find-file.sh "glob pattern"
# find-file.sh "glob pattern" /path

# Setup
glob="$1"
path="$2"
[ -z $path ] && path="./"

if [ $# -eq 0 ]; then
	echo "Usage: $0 glob_pattern [path]"
	return 2
fi

# Search for files
find "$path" -iwholename "*$glob*"

