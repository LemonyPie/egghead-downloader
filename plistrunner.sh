#!/bin/bash
rm -rf "log.txt"

while read TASK
do
  echo -e "\033[37;1;41m starting new task $TASK \033[0m"
  . taskrunner.sh $TASK
done < plist.txt | tee log.txt
