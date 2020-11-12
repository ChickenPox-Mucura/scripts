#!/usr/bin/env bash

# Program variables

build_b="/home/stinkfist/backuptmp"
SBo="compiled"

# Root check
[[ "$UID" -gt "0" ]] && { echo "Permission denied"; exit 1 ;}

# build_b dir check
[[ ! -d "$build_b" ]] && { echo "creating backuptmp directory..."; mkdir "$build_b" ;}

function backup(){
	if cd /tmp; then
	tar -cvzf "$SBo" *_SBo.tgz && mv -v "$SBo" "$build_b"
	fi
}

case "$1" in
	-b|--backup)
		backup
	;;
	-h|--help)
		echo \
		"-b, --backup | backup files"
	;;
	*)
		echo \
		"-h or --help for help"
esac
