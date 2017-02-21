#!/bin/bash

roottrade_path=$1
catalina_path=$2
export roottrade=roottrade.log
export catalina=catalina.log
while :
do

sleep 1

tail -n 500 $roottrade_path > $roottrade 2>&1
tail -n 500 $catalina_path > $catalina 2>&1

done
