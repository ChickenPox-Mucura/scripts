#!/usr/bin/sh

dunstify "Battery [`battery`]" -h int:value:"`battery`"
