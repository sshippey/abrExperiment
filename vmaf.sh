#!/usr/bin/env bash

echo "Usage: ./vmaf.sh <reference file> <distorted file> <reference resolution>"

./ffmpeg-git/ffmpeg \
    -hide_banner \
    -loglevel error -stats \
    -i $1 \
    -i $2 \
    -lavfi "[0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]scale=$3:flags=bicubic,setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]libvmaf=log_fmt=json:log_path=$2.vmaf.json:model=path=ffmpeg-git/model/vmaf_v0.6.1.json:n_threads=4; \
            [0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]scale=$3:flags=bicubic,setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]ssim=stats_file=$2.ssim; \
            [0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]scale=$3:flags=bicubic,setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]psnr=stats_file=$2.ssim" \
    -f null -
