#!/usr/bin/env bash
# $1 - Video directory
# $2 - Distorted resolution
# $3 - Out directory


END=34
for ((i=0;i<=END;i+=2)); do
  mkdir -p $3
  ./vmaf.sh $1/1080-splits/$i-h264_1080p.mp4 $1/$2-splits/$i-h264_$2p.mp4 > $3/vmaf-2-$i.json
  #node getvmafs.js $1/vmaf-2-$i.json
done
