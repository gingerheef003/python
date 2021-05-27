#!/bin/bash
nologo="$1"
sln=`echo "$2"`
fileLine="$3"
file=`echo "$fileLine" | cut -d';' -f1`
line=`echo "$fileLine" | cut -d';' -f2`
if [ $line = "-1" ]; then
line=0
fi

PID=`ps aux | grep "/usr/bin/monodevelop" | grep "$sln"`
if [[ "" == $PID ]]; then
    exec -a "Monodevelop Unity" `monodevelop "$sln" "$file;$line"`
else
    exec -a "Monodevelop Unity" `monodevelop "$file;$line"`
fi