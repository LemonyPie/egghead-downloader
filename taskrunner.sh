#!/bin/bash
START_TIME=$(date +%s);
echo -e "\033[37;1;41m start time: $(date) \033[0m";
echo -e "\033[37;1;41m making download list for $1 \033[0m";
#node scrapper/scrapper.js $1;
echo -e "\033[37;1;41m download list generated \033[0m";
num=18;

while read ADDRESS
do
  file_start_time=$(date +%s)
  echo -e "\033[37;1;41m new file: $ADDRESS \033[0m"
  echo -e "\033[37;1;41m number: $num \033[0m"
  . download.sh $ADDRESS $num
  file_end_time=$(date +%s)
  echo -e "\033[37;1;41m file $num finished in $(( $file_end_time - $file_start_time)) \033[0m"
  num=$(($num+1))
done < task.txt

#rm -rf 'task.txt';
echo -e '\033[37;1;42m all tasks are completed \033[0m';

END_TIME=$(date +%s)
TOTAL_TIME=$(( $END_TIME - $START_TIME ))
echo "It took $TOTAL_TIME seconds in total"
