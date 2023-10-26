#!/bin/bash

# in=$2/out-$1-250k-480.mp4,stream=audio,output=$3/audio.mp4 \

packager --segment_duration $2 \
in=$1-profile1.mp4,stream=video,output=$1-profile1.mp4 \
in=$1-profile2.mp4,stream=video,output=$1-profiler.mp4 \
in=$1-profile3.mp4,stream=video,output=$1-profile3.mp4 \
in=$1-profile4.mp4,stream=video,output=$1-profile4.mp4 \
in=$1-profile5.mp4,stream=video,output=$1-profile5.mp4 \
in=$1-profile6.mp4,stream=video,output=$1-profile6.mp4 \
in=$1-profile7.mp4,stream=video,output=$1-profile7.mp4 \
in=$1-profile8.mp4,stream=video,output=$1-profile8.mp4 \
in=$1-profile9.mp4,stream=video,output=$1-profile9.mp4 \
in=$1-profile0.mp4,stream=video,output=$1-profile0.mp4 \
--mpd_output h264.mpd
