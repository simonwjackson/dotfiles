#!/bin/env zsh

# Bottomline VPN 

bottomline_vpn() {
	user="simonwjackson"
	server="goomba.mynetgear.com"
	port="9999" 

  sshuttle --dns --remote $user@$server:$port --exclude $server 0/0
	#10.231.50.14/0
	#10.11.13.93/0
}

bigsync () {
	echo "BW_SESSION=$(bw unlock --raw)" >! ${HOME}/.keys/bitwarden.env \
		&& export $(cat ~/.keys/bitwarden.env) \
		&& bugwarrior-pull \
		&& task sync
}

vim_commit () {
	file="${HOME}/.config/nvim/init.vim"

	# for var in "$@"
	# do
	#   echo "PlugInstall $var" >> $file
	# done

	#sort "$file" | uniq > "$file" 
	#npm install --global "$@"
}

arch_commit () {
	file="${HOME}/.config/packages/arch.install"

	for var in "$@"
	do
		echo "$var" >> $file
	done

	sort "$file" | uniq > "$file" 
	yay -S --noconfirm "$@"
} 

npm_commit () {
	file="${HOME}/.config/packages/npm"

	for var in "$@"
	do
		echo "$var" >> $file
	done

	sort "$file" | uniq > "$file" 
	npm install --global "$@"
} 
