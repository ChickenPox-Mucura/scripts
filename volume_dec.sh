#!/usr/bin/sh

amixer -c 1 set Master 5%- && dunstify -h string:x-canonical-private-synchronous:screen "Volume `amixer -c 1 get Master | grep dB | cut --delimiter=' ' -f 6` " -h int:value:"`amixer -c 1 get Master | grep dB | cut --delimiter=' ' -f 6 | sed s/[[:punct:]]//g`" 
