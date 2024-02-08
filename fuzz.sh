#!/bin/sh
help()
{
echo "Usage: $0 -u <URL> [-w <DICTIONARY>] [-c <CODES>]"
echo "Options:"
echo "-h - Opens options"
echo "-u <URL> - Start fuzzing with default dictionary"
echo "-w <DICTIONARY> - Start fuzzing with your dictionary"
echo "-c <CODES> - Define your positive codes"
}

deaf_dictionary="di\nnana\nalko\namko\nnealko"
codes="200"

while getopts ":hu:w:c:" opt; do
	case $opt in
		u) url="$OPTARG";;
		w) n_dictionary="$OPTARG";;
		c) codes="$OPTARG";;
		h) help;;
		\?) echo "Invalid option: -$OPTARG" help;;
	esac
done
echo "$n_dictionary"

if [ -z "$url" ]; then
	echo "Error: URL must be provided"
	exit
fi
#echo "lolol"

if [ -z "$codes" ]; then
	codes=200;
fi

if [ -z "$n_dictionary" ]; then
	dictionary="$deaf_dictionary"
else
	dictionary=$(cat "$n_dictionary")
fi

echo "$dictionary"

echo "$dictionary" | while IFS= read -r word; do
	new_url=$(echo "$url" | sed "s/FUZZ/$word/")
	echo "$new_url"
	response=$(curl -o /dev/null -s -w "%{http_code}" "$new_url")
	for status in $(echo $codes | tr ',' ' '); do
		if [ "$response" = "$status" ]; then
			echo "Found [$response]: $new_url"
		fi
	done
done
