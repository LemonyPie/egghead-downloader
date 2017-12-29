#!/bin/bash
echo -e "\033[37;1;41m concating video \033[0m"
cd video/
cat init.mp4 > video.mp4

for ((j = 0; j <= $1; j++))
  do
    cat seg_$j.m4s >> video.mp4
  done;

echo -e '\033[37;1;41m concating audio \033[0m'
cd ../audio/

cat init.mp4 > audio.mp4
for ((j = 0; j <= $1; j++))
  do
    cat seg_$j.m4s >> audio.mp4
  done

cd ..
echo -e '\033[37;1;41m merging audio and video \033[0m'

if ! [ -d "result/$4" ]; then
  mkdir -p "result/$4"
  chmod a+w "result/$4"
fi;

echo -e "\033[37;1;41m mp4box \033[0m"
MP4Box -add video/video.mp4 -add audio/audio.mp4 result/$4/$3-mp4box-$2.mp4

# echo -e "\033[37;1;41m ffmpeg \033[0m";
# ffmpeg -i video/video.mp4 -i audio/audio.mp4 result/$4/$3-ffmpeg_$2.mp4;

echo -e "\033[37;1;41m concatenation finished \033[0m"
