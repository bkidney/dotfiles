#!/bin/sh

# Fixes problems using the webcam with Chrome is MacOS Sierra

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
	sudo killall AppleCameraAssistant;sudo killall VDCAssistant
else
	echo "This command is for MacOS only."
fi
