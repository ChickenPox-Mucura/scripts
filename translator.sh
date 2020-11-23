#!/usr/bin/env bash

echo "Welcome to Google Translate!"
echo "Verifying your internet connection..."

if wget -q --spider www.pudim.com.br; then
	echo ""
	clear
else
	{ echo "No internet connection"; sleep 2s; clear; exit 1 ;}
fi

while true; do
	read -p "Word: " _word

	if [[ -n "$_word" ]]; then
		translate -t portuguese -f english "$_word"
	else
		break
	fi
done
