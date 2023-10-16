#!/bin/bash

# in=$2/out-$1-250k-480.mp4,stream=audio,output=$3/audio.mp4 \
#
packager --segment_duration 2 \
in=$2/out-$1-250k-480.mp4,stream=video,output=$3/h264_480p.mp4 \
in=$2/out-$1-1M-720.mp4,stream=video,output=$3/h264_720.mp4 \
in=$2/out-$1-6M-1080.mp4,stream=video,output=$3/h264_1080p.mp4 \
in=$2/out-$1-50M-4k.mp4,stream=video,output=$3/h264_4k.mp4 \
--mpd_output $3/h264.mpd
