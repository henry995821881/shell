#!/bin/bash

file_path=$1
i=0
for a in `awk -F ':' '{print $1}' $file_path`
do 
  echo $a
  arr[$i]=$a
  i=$i+1
done

echo $arr
