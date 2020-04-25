#!/bin/bash
source ./file_tools.sh

fileTypes='java properties sql'

for fileType in $fileTypes
do
	echo "begin deal with $fileType files"
	for fileName in `find -name "*.$fileType"`
	do
		replace_text $fileName '组织本币' '账簿本币'
		if [ $? -ne 0 ]
		then
			echo "REPLACE ERROR $fileName"
		fi
	done
done
