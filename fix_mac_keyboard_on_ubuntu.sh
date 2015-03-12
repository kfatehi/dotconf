#!/bin/bash
# http://askubuntu.com/questions/530325/tilde-key-on-mac-air-with-ubuntu
FINAL_PATH=/usr/share/X11/xkb/symbols/pc
PRISTINE_PATH=/usr/share/X11/xkb/symbols/pc.pristine
REPLACEMENT="key <LSGT> { [ grave, asciitilde, grave, asciitilde ] };"
SED_PATTERN="s/.*<LSGT>.*/$REPLACEMENT/g"
if [[ -f $FINAL_PATH ]]; then
	if [[ ! -f $PRISTINE_PATH ]]; then
		# it's the first run. back up to the pristine path
		cp -v $FINAL_PATH $PRISTINE_PATH
	fi
	sed "$SED_PATTERN" $PRISTINE_PATH > $FINAL_PATH
	rm -rf /var/lib/xkb/*
else
	echo "$FINAL_PATH does not exist. You're definitely not on ubuntu 14.04, that's for sure. Skipping"
fi
