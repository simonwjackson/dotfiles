#!/usr/bin/zsh

file=${0:a}
dir=${0:a:h}

case "$1" in 
	done) 
		${dir}/done.sh
		;; 

	add) 
		${dir}/add.sh
		;; 

	*) 
		echo "add\ndone" \
			| fzf \
				--inline-info \
				--layout=reverse \
			| xargs -I %a $file %a

esac
