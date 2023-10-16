#!/bin/bash

VIDEO_NAME=$1
if [ -z "$1" ]
  then
    VIDEO_NAME="default.yuv"
fi

OUT_FOLDER=$2
if [ -z "$2" ] 
  then
    OUT_FOLDER="default_out"
fi

if [ ! -d $OUT_FOLDER ] 
  then
    mkdir -p $OUT_FOLDER
fi

FRAMERATE=$3
if [ -z $3 ] 
  then
    FRAMERATE=30
fi

LADDER=$4
if [ -z $4 ]
  then
    LADDER="ladder.txt"
fi

#while read p; do
#  BITRATE="${p%,*}"
#  RESOLUTION="${p#*,}"
#  echo $BITRATE
#  echo $RESOLUTION
#  ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v $BITRATE -vf scale=$RESOLUTION -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-$BITRATE-$RESOLUTION.mp4
#done < $LADDER

#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate 120 -i $VIDEO_NAME -b:v $OUT_FOLDER -vf scale=$3 -c:v libx264 $4/out-$VIDEO_NAME-OUT_FOLDER-$3.mp4
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 250k -vf scale=640x480 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-250k-480.mp4
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 500k -vf scale=1280x720 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-500k-720.mp4
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 1m -vf scale=1280x720 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-1M-720.mp4
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 2m -vf scale=1920x1080 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-2M-1080.mp4
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 6m -vf scale=1920x1080 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-6M-1080.mp4
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 25m -vf scale=3840x2160 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-25M-4k.mp4
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 50m -vf scale=3840x2160 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-50M-4k.mp4
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 50m -vf scale=3840x2160 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-50M-4k.mp4
#ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 8192x4096 -framerate $FRAMERATE -i $VIDEO_NAME -b:v 100m -vf scale=3840x2160 -c:v libx264 $OUT_FOLDER/out-$VIDEO_NAME-100M-4k.mp4
