#!/usr/bin/zsh

$setup_dir=dirname $0

source $(setup_dir)/_before.sh 
source $(setup_dir)/arch.sh 
source $(setup_dir)/neovim.sh
source $(setup_dir)/firefox.sh

# ZSH

rm ${HOME}/.zshrc
ln -s ${HOME}/.config/zsh/rc ${HOME}/.zshrc

source $(setup_dir)/nvm.sh

# task warrior 
rm ${HOME}/.taskrc
ln -s .config/task/rc ${HOME}/.taskrc

# Mutt
rm ${HOME}/.mailcap
ln -s ${HOME}/.config/mailcap ${HOME}/.mailcap

rm ${HOME}/.muttrc
ln -s ${HOME}/.config/mutt/rc ${HOME}/.muttrc

source $(setup_dir)/bluetooth.sh
source $(setup_dir)/services.sh 
source $(setup_dir)/pip.sh 
source $(setup_dir)/backlight.sh
