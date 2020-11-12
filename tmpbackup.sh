#!/usr/bin/env bash

# Program variables

build_b="$PWD/tmpbackup"
SBo="compiled_pkg"

# Root check
[[ "$UID" -gt "0" ]] && { echo "Permission denied"; exit 1 ;}

# build_b dir check

# Functions
function backup(){
	[[ ! -d "$build_b" ]] && { echo "creating backuptmp directory..."; mkdir "$build_b" ;}
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
