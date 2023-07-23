#!/bin/sh
#export INFOBEAMER_FULLSCREEN=1
#export INFOBEAMER_FULLSCALE=1
export INFOBEAMER_TARGET_W=1024
export INFOBEAMER_TARGET_H=768
export INFOBEAMER_ADDR=127.0.0.1

while sleep 5 ; do
	(sleep 30 ; $HOME/info-beamer-pi/cert-clock/cert-clock-set.py) &
	$HOME/info-beamer-pi/info-beamer $HOME/info-beamer-pi/cert-clock
done
