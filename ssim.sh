#!/usr/bin/env bash

./ffmpeg-git/ffmpeg \
    -hide_banner \
    -loglevel error -stats \
    -i $1 \
    -i $2 \
    -lavfi "[0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]scale=1920:1080:flags=bicubic,setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]ssim=stats_file=-; \
            [0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]scale=1920:1080:flags=bicubic,setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]psnr=stats_file=-" \
    -f null -
