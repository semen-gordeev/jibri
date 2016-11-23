#!/bin/bash
#Directory for storing pids (should be writeable by jibri user)
PID_DIR=/var/run/jibri/

export DISPLAY=:0

#launch xorg and wait
Xorg -noreset  +extension RANDR +extension RENDER -logfile ./xorg.log  -config ./xorg-video-dummy.conf :0 > /tmp/jibri-xorg.out 2>&1 &
echo $! > $PID_DIR/Xorg.pid
sleep 1

#hide mouse
DISPLAY=":0" xdotool mousemove 1280 0

#launch a window manager and wait
icewm-session > /tmp/jibri-icewm.out 2>&1 &
echo $! > $PID_DIR/icewm.pid
sleep 1