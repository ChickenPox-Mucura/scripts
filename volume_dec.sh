#!/usr/bin/sh

amixer set Master 5%- && dunstify -h string:x-canonical-private-synchronous:screen "Volume `amixer get Master | grep Left | tail -1 | cut --delimiter=' ' -f 7` " -h int:value:"`amixer get Master | grep Left | tail -1 | cut --delimiter=' ' -f 7 | sed s/[[:punct:]]//g`" 
