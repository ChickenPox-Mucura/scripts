#!/usr/bin/env bash

# Source .conf file
source /home/stinkfist/sys-log/login_psswrd.conf
variables
source /home/stinkfist/sys-log/libhelp

# IN-LINE Call

# Functions======================#

function login(){
		read -p "Login: " _login
		read -t 5 -sp "Password: " _pass
		if [[ "$_login" = "stinkfist" ]] && [[ "$_pass" -eq "$pass" ]]; then
			echo ""
			sleep 1s
			clear
		elif [[ "$_login" != "$user" ]]; then
			echo "Wrong username or password"
			sleep 0.5s
			exit 1
		elif [[ "$_pass" != "$pass" ]]; then
			echo "Wrong username or password"
			sleep 0.5s
			exit 1
		fi


		echo \
		"+++++++++Welcome, $user++++++++
		1) Leafpad
		2) XMMS
		3) cacafire
		4) Leave
		+++++++++++++++++++++++++++++++++++
		"


		read -p "Select an option: " option

		case "$option" in
			1)
				[[ $(type -P leafpad) ]] || { echo "leafpad not found!"; exit 1 ;}
				leafpad & 
			;;

			2) xmms ;;
			3) cacafire & ;;
			4) clear && exit 0 ;;
		esac

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


#if [[ "option" -eq "1" ]]; then
#	leafpad &
#elif [[ "option" -eq "2" ]]; then
#	xmms &
#elif [[ "option" -eq "3" ]]; then
#	cacafire
#elif [[ "option" -eq "4" ]]; then
#	exit 0
#else
#	echo "Invalid option!"
#	exit 1
#fi

#==========================================
# Se colocar um "||" no lugar do "&&" ficará:
# "desde que qualquer um dos dois testes retorne
# status de saída 0, você estará logado"
#==========================================
#
#
