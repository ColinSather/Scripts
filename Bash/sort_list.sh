#!/bin/sh

first=$'apple'
next=$'zebra'
last=$'bananas'
result="${first} ${next} ${last}"
#echo "$result"
echo "$result" | tr ' ' '\n' | sort | tr '\n' ' '

