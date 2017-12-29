#!/usr/bin/env bash
echo -e "\033[37;1;41m making download list for $1 \033[0m";
node scrapper/scrapper.js $1;
echo -e "\033[37;1;41m download list generated \033[0m";
num=0;

while read ADDRESS;
do
  echo -e "\033[37;1;41m new file: $ADDRESS \033[0m";
  . download.sh $ADDRESS $num;
  num=$(($num+1));
done < task.txt;

rm -rf 'task.txt';
echo -e '\033[37;1;42m all tasks are completed \033[0m';
