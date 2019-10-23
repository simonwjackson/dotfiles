#!/bin/env zsh

cat /usr/share/wordnet/dict/index.* | \
	awk '{print $1}' | 
	sed '/^[0-9\.]/ d' | \
	fzf \
		--layout=reverse \
		--preview 'wn {} -over | fold' \
		--preview-window=down:80% | \
	wl-copy
