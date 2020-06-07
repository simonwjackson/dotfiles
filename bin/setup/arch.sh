#!/bin/sh

# YAY is a dependency
if ! [ -x "$(command -v yay)" ]; then
  pacman \
    --sync \
    --needed \
    --noconfirm \
      libffi base-devel procps-ng go
      
  inform "Installing yay"
  TMP_YAY=$(sudo -u "${USER}" mktemp --directory)
  sudo -u "${USER}" bash -c 'cd ~ && git clone https://aur.archlinux.org/yay.git "${TMP_YAY}" && cd "${TMP_YAY}" && makepkg -si --noconfirm'
  sudo -u "${USER}" rm -rdf "${TMP_YAY}"
fi

# Install all packaged located in
# ${HOME}/.config/packages/arch
sudo -u "${USER}" yay \
  --needed \
  --noconfirm \
  --sync \
  - <<< $(cat ${HOME}/.config/packages/arch | sed -e '/^[ \t]*#/d')
