#!/bin/bash

echo -e '\033[37;1;41m starting download \033[0m'

link=$1
name=${link#*//*/}
name=${name%-*}
plist_item=$3

mkdir "audio"
mkdir "video"

wget -O audio/init.mp4 "$1/audio/init.mp4"
wget -O video/init.mp4 "$1/video/720p/init.mp4"

i=0
while :
 do
   echo -e "\033[37;1;41m downloading segment $i \033[0m"
   wget -O audio/seg_$i.m4s "$1/audio/seg_$i.m4s"
   wget -O video/seg_$i.m4s "$1/video/720p/seg_$i.m4s"
   [ $? -ne 0 ] && break
   i=$(($i+1))
done

echo -e "\033[37;1;41m sending $name for process of $i segments \033[0m"
. concat.sh $i $name $2 $plist_item


echo -e '\033[37;1;41m purging \033[0m'
rm -rf "audio"
rm -rf "video"

echo -e '\033[37;1;42m completed \033[0m'
