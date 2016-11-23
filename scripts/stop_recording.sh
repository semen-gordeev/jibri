#!/bin/bash
PID_DIR=/var/run/jibri/
$PWD/../scripts/stop-ffmpeg.sh
sleep 1
killall chrome
killall chromedriver
killall chromium
rm ${PID_DIR}*.pid
