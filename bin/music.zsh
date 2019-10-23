#!/bin/env zsh

function all_albums () {
	beet ls -a | shuf
}

function all_albums_menu () {
	all_albums \
		| fzf --layout=reverse \
		| sed 's/ - / /'
} 

album_choice=$(all_albums_menu)

if [[ -z ${album_choice} ]]; then
	;
else
	album_path=$(beet ls -f '$path' -a $(echo ${album_choice} | awk '{print $0}'))

	${HOME}/bin/xdg-audio --no-resume-playback ${album_path}
fi
