#!/bin/sh

# YAY is a dependency
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

# Install all packaged located in
# ${HOME}/.config/packages/arch
sudo -u "${USER}" yay \
  --needed \
  --noconfirm \
  --sync \
  - <<< $(cat ${HOME}/.config/packages/arch | sed -e '/^[ \t]*#/d')
