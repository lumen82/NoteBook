#!/bin/bash

## is a text file
is_text(){
	fileName=$1
	result=`file -i $fileName | awk -F'[ ;]' '{print $2}'`
	if [[ $result =~ 'text' || $result =~ 'octet-stream' ]]
	then 
		return 0
	else 
		return 1
	fi
}

# get file encoding
get_encoding(){
	fileName=$1
	result=`file -i $fileName | awk -F'[ ;]' '{print $4}' | awk -F'=' '{print $2}'`
	if [[ $result =~ 'iso-8859-1' || $result =~ 'unknown' ]]
	then
		result='GBK'
	fi
	echo $result
}

# replace string in text file
replace_text(){
	fileName=$1
	sourceSrc=$2
	destSrc=$3
	is_text $fileName
	if [ $? -eq 0 ]
	then
		fileEncoding=`get_encoding $fileName`
		echo $fileEncoding
		if [[ ! $fileEncoding =~ 'binary' ]]
		then
			`iconv -f $fileEncoding -t UTF-8 $fileName -o temp.rplctemp`
			`sed -i "s/$2/$3/g" temp.rplctemp`
			`iconv -f UTF-8 -t $fileEncoding temp.rplctemp -o $fileName`
			`rm temp.rplctemp`
		else
			sed -i "s/$2/$3/g" $fileName
		fi
	else
		echo "$fileName is not a text file"
	fi
}
