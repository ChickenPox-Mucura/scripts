#!/bin/ksh93
power=$(battery)

while [[ $(battery) != 8% ]]; do
	sleep 30
done

dunstify -a "power" "LOW BATTERY POWER!!! [`battery`]"
