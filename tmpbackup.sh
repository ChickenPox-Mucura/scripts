#!/usr/bin/env bash

# Program variables

SBo="compiled_pkg"

# Root check
[[ "$UID" -gt "0" ]] && { echo "Permission denied"; exit 1 ;}

# Functions
function backup(){
	read -p "Please set up a directory to store your backup (path/to/backup): " build_b
	[[ ! -d "$build_b" ]] && { echo "creating backuptmp directory..."; mkdir "$build_b" ;}
	if cd /tmp; then
	tar -cvzf "$SBo" *_SBo.tgz && { mv -v "$SBo" "$build_b" ;} 
	clear
	echo "All files backed up to $build_b directory and compressed to gzip format"
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
