#!/bin/env zsh

export $(cat ${HOME}/.keys/bitwarden.env) && bw sync &> /dev/null

if [[ $? -eq 0 ]]; 
	then 
		echo ""; 
	else 
		echo " <span background='red' foreground='black' weight='bold'> VAULT LOCKED </span> "; 
fi
