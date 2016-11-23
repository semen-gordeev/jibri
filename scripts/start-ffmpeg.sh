#!/bin/bash

STREAM=$1

: ${RESOLUTION:=1920x1080}
: ${RATE:=30}
: ${PRESET:=veryfast}
: ${YOUTUBE_BASE:="rtmp://a.rtmp.youtube.com/live2"}
: ${QUEUE_SIZE:=4096}

#use alsa directly
: ${INPUT_DEVICE:='hw:0,1,0'}

: ${MAX_BITRATE:='1984'}
: ${BUFSIZE:=$(($MAX_BITRATE * 2))}

#use pulse for audio input
#INPUT_DEVICE='pulse'


DISPLAY=:0

#Record the output of display :0 plus the ALSA loopback device hw:0,1,0
exec ffmpeg -y -v debug \
    -f x11grab -r $RATE -s $RESOLUTION -thread_queue_size $QUEUE_SIZE -i :0.0+0,0 \
    -f alsa -thread_queue_size $QUEUE_SIZE -i $INPUT_DEVICE -acodec aac -ar 44100 \
    -c:v libx264 -preset $PRESET -maxrate ${MAX_BITRATE}k -bufsize ${BUFSIZE}k -pix_fmt yuv420p -r 30 \
    -crf 28 -g 60  -tune zerolatency \
    -f mp4 $STREAM > /tmp/jibri-ffmpeg.out 2>&1 &
echo $! > /var/run/jibri/ffmpeg.pid
