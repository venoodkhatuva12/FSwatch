#!/bin/bash

fswatch -0 -d /Users/venood/.jenkins/*.xml | while read -d "" event

do

mkdir -p /tmp/jenkinsa

sudo cp -aR /Users/venood/.jenkins/*.xml /tmp/jenkinsa

diff -c /tmp/jenkinsa /tmp/jenkinsb > /tmp/jenk

sleep 5

cat /tmp/jenk | mail -s "There is a change in the filesystem" dbura@apple.com

sudo cp -aR /tmp/jenkinsa/* /tmp/jenkinsb/
sleep 10
done 

for f in ~/apps/*;
  do 
     [ -d $f ] && cd "$f" && echo Entering into $f and installing packages
  done;


for d in *; do
  if [ -d "$d" ]; then 
    ( cd "$d" && grade build )
  fi
done
