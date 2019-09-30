#!/usr/bin/zsh

# install latest version
source /usr/share/nvm/init-nvm.sh
nvm install node

# global eslint is required for vim-ale :(
npm i -g eslint
