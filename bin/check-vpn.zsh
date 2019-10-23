#!/bin/env zsh

if [[ $(ps -e | grep sshuttle | wc -l) > 0 ]]; then 
	echo " <span background=\"blue\" foreground=\"black\"> VPN </span> "; 
fi
