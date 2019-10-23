#!/bin/env zsh

if [[ $(timew | head -n 1 | sed -r 's/.+?"(.+?)".*/\1/') == "There is no active time tracking." ]]; 
then 
	echo "<span foreground=\"red\">░▒▓ ╳ NOT TRACKING TIME ╳ ▓▒░</span>";   
else 
	echo "<span>⛏</span><span foreground='#d7d7d7'> $(timew | head -n 1 | sed -r 's/.+?"(.+?)".*/\1/'): <span foreground='green'>$(${HOME}/bin/active-task-time.sh)</span> </span>"; 
fi  
