# Using Jibri
These are some very rough notes on how to setup a machine for jibri:

* Make sure the user you use is in all needed groups. Not sure which ones are required, but they're a subset of {ubuntu, adm, dialout, cdrom, floppy, sudo, audio, dip, video, plugdev, netdev}. 
* Load the needed alsa-modules:
    modprobe snd-aloop 
* Copy asoundrc to ~/.asoundrc
* Ensure that the latest ffmpeg is installed:
  - sudo add-apt-repository ppa:mc3man/trusty-media
  - sudo apt-get update
  - sudo apt-get dist-upgrade

* Install all required software (TODO: check for missing software, include instructions)
  - alsa + snd_aloop
  - pulse
  - Xorg, video-dummy
  - icewm
  - chrome/chromium
  - chromedriver
  - python (pip): selenium
  - ffmpeg (preferably the real thing, not libav)
  - mplayer, imagemagick
  

# Environment

```pip install -r requirements.txt```


## Running

1. run ```script/before_start.sh```

2. ```python3 app.py -d``` from ./jibri-xmpp-client/

3. start recording -> ```curl -H "Content-Type: application/json" -X POST -d '{"url":"https://jitsi.example.com/test","stream":"output.mp4","token":"abc123"}' http://localhost:5000/jibri/api/v1.0/start```

4. stop recording -> ```curl -H "Content-Type: application/json" -X POST http://localhost:5000/jibri/api/v1.0/stop```
