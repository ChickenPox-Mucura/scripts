#!/usr/bin/env bash

# Variables
user="stinkfist"
pass="1234"
total="0"
PS3="Select a program: "
# Functions======================#
function login(){
	while true; do
		read -p "Login: " _login
		read -p "Password: " _pass
		if [[ "$_login" = "stinkfist" ]] && [[ "$_pass" -eq "$pass" ]]; then
			sleep 1s
			clear
			break
		else
			let total++
			[[ "$total" -eq "3" ]] && { echo "3 failed attempts. Exiting..."; sleep 1s; exit 0 ;} \
			|| echo "Login or password incorrect. Attempts: $total/3"
		fi
	done

	echo "Welcome, $user"
	select program in "leafpad" "gedit" "sublime" "exit"; do
		case "$REPLY" in
			1)
				[[ $(type -P leafpad) ]] || { echo "leafpad not found!"; exit 1 ;}
				leafpad &
			;;

			2)
				[[ $(type -P gedit) ]] || { echo "gedit not found!"; exit 1 ;}
				gedit &
			;;
			3)
				[[ $(type -P sublime_text) ]] || { echo "sublime not found"; exit 1 ;}
				sublime_text &
			;;
			4)
				clear
				exit 0
			;;
		esac
	done

}

case "$1" in
	-l|--login)
		login
		;; # Closes -l block, --login

		-h|--help)
			help	
		;;
		
		-b|--backup)
			echo "Dir 1: $2"
			echo "Dir 2: $3"
		;;
		*) 
			echo \
			"-h or --help for assistance"
esac # Case principal
