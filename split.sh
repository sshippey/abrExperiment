#!/usr/bin/env bash

END=34
for ((i=0;i<=END;i+=$1)); do
    echo $i
    ffmpeg -i $2 -ss $i -t 2 $3/$i-$2
done
