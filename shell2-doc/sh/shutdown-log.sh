#!/bin/bash

export WHILE_PID_FILE=while.pid

if [ -e $WHILE_PID_FILE ];then
   echo "stop log....."
   echo "killing `cat $WHILE_PID_FILE`"
   kill -9 `cat $WHILE_PID_FILE`
   rm -f $WHILE_PID_FILE

else
   
    echo "log not running"
fi
