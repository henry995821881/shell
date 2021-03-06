#!/bin/bash

roottrade_path=$1
catalina_path=$2
WHILE_PID_FILE="while.pid"

nohup ./while.sh $roottrade_path $catalina_path >/dev/null 2>&1 &

if [ -f "$WHILE_PID_FILE" ];then

    
   kill -9 `cat $WHILE_PID_FILE`
   sleep 2

   echo $!
   echo $! > $WHILE_PID_FILE

else 

  touch while.pid 
  echo $!
  echo $! > while.pid
fi

exit 0
