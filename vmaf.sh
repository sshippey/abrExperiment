#!/usr/bin/env bash

./ffmpeg-git/ffmpeg \
    -hide_banner \
    -loglevel error -stats \
    -i $1 \
    -i $2 \
    -lavfi "[0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]scale=1920:1080:flags=bicubic,setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]libvmaf=log_fmt=json:log_path=/dev/stdout:model=path=/usr/local/share/model/vmaf_v0.6.1.json:n_threads=4" \
    -f null -

