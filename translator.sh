#!/bin/ksh

print "Welcome to Google Translate!"
print "Verifying your internet connection..."

if wget -q --spider www.pudim.com.br; then
	clear
else
	{ print "No internet connection"; sleep 2s; clear; exit 1 ;}
fi

while true; do
	read _word?"Word: " 

	if [[ -n "$_word" ]]; then
		translate -t pt-BR -f en-US "$_word"
	else
		break
	fi
done
