#!/usr/bin/zsh

yay \
	--needed \
	--noconfirm \
	--sync \
	- < ${HOME}/.config/packages/arch.install 

cat ${HOME}/.config/packages/arch.remove | xargs --max-lines=1 yay --noconfirm --remove -s -
