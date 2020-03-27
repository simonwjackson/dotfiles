#!/usr/bin/zsh

# TODO: AUR update should be moved an init script.
curl https://www.archlinux.org/mirrorlist/?ip_version=6 \
  | sed 's/^#Server/Server/' 
  | sudo tee /etc/pacman.d/mirrorlist

yay \
  --needed \
  --noconfirm \
  --sync \
  - <<< $(cat ${HOME}/.config/packages/arch | sed -e '/^[ \t]*#/d')
