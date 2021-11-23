#!/usr/bin/sh

xbacklight -20 && dunstify -h string:x-canonical-private-synchronous:screen "Brightness [`xbacklight -get`] " -h int:value:"`xbacklight -get`"
