#!/bin/bash

input=$1

for line in `egrep "SDT" $input | sed 's/ /£/g' | awk -F"," '{print $2","$6}'`; do
#for line in `egrep "SDT" $input | awk -F"," '{print $2","$6}'`; do
	echo "$line" | sed 's/£/ /g'
#	echo "$line"
#	sed -i.bak 's///g' $input
	uniqueComb=$(echo "$line" | awk -F"," '{print $1}')
	channelName=$(echo "$line" | sed 's/£/ /g' | awk -F"," '{print $2}')
	echo $uniqueComb " --- " "$channelName"
	
	eval "sed -i.bak 's/^EIT,xxx,$uniqueComb/$channelName,$uniqueComb/g' $input"
	
	
done

	sed -i.bak 's/^SDT.*//g' $input
