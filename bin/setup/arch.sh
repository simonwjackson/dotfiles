#!/bin/sh

if ! [ -x "$(command -v yay)" ]; then
  pacman \
    --sync \
    --needed \
    --noconfirm \
      libffi \
      base-devel \ 
      procps-ng \
      go
      
  inform "Installing yay"
  sudo -u "${USER}" bash -c 'cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm'
fi

sudo -u "${USER}" yay \
  --needed \
  --noconfirm \
  --sync \
  - <<< $(cat ${HOME}/.config/packages/arch | sed -e '/^[ \t]*#/d')
