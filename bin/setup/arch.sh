#!/bin/sh

# Install all packaged located in
# ${HOME}/.config/packages/arch
sudo -u "${USER}" yay \
  --needed \
  --noconfirm \
  --sync \
  - <<< $(cat ${HOME}/.config/packages/arch | sed -e '/^[ \t]*#/d') 3>&2 2>&1 1>&3 3>&-
