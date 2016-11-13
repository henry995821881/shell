#!/bin/bash

echo "shell ";

for i in "$*";do
	echo $i
done



for i in "$@";do 
	echo $i
done
