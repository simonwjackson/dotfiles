#!/bin/env zsh

if [[ $(timew | head -n 1 | sed -r 's/.+?"(.+?)".*/\1/') == "There is no active time tracking." ]]; then 
	timew continue
else 
	timew stop
fi
