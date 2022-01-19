#!/bin/ksh

artist=$(mocp -i | grep Artist | sed s/'Artist: '//g)
song=$(mocp -i | grep Song | sed s/'SongTitle: '//g)
totaltime=$(mocp -i | grep TotalTime | sed s/'TotalTime: '//g)
currentTime=$(mocp -i | grep CurrentTime | sed s/"CurrentTime: "//g)

dunstify -a "MOC" "$(echo -e "// $artist - $song //\\n[$currentTime/$totaltime]")"

