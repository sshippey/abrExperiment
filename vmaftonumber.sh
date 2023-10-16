#!/usr/bin/env bash
# $1 - Video directory
# $2 - Distorted resolution
# $3 - Out directory


END=34
for ((i=0;i<=END;i+=2)); do
  node getvmafs.js $1/vmaf-2-$i.json
done
