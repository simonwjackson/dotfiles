#!/usr/bin/zsh

yay \
	--needed \
	--noconfirm \
	--sync \
	- <<< $(cat ${HOME}/.config/packages/arch | sed -e '/^[ \t]*#/d')

