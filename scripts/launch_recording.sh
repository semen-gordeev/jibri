#!/bin/bash
#Directory for storing pids (should be writeable by jibri user)
PID_DIR=/var/run/jibri/

URL=$1
STREAM=$2
TOKEN=$3
YOUTUBE_STREAM_ID=$4
YOUTUBE_BACKUP=$5

#
#YOUTUBE_BASE="rtmp://a.rtmp.youtube.com/live2"
#
#if [ ! -z "$5" ]; then
#    YOUTUBE_BASE="rtmp://b.rtmp.youtube.com/live2"
#fi
#
#if [ ! -z "$4" ]; then
#    STREAM="${YOUTUBE_BASE}/${YOUTUBE_STREAM_ID}"
#
#    if [ ! -z "$5" ]; then
#        STREAM="${STREAM}?backup=1"
#    fi
#
#fi

$PWD/../scripts/start-ffmpeg.sh "$STREAM"

