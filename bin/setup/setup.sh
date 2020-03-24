#!/usr/bin/zsh

#$setup_dir=dirname $0

# source $(setup_dir)/_before.sh 
source ${HOME}/bin/setup/arch.sh 
# source $(setup_dir)/neovim.sh
# source $(setup_dir)/firefox.sh

# ZSH

ln -nfs ${HOME}/.config/zsh/rc ${HOME}/.zshrc
chsh -s $(which zsh)

# ZSH

ln -nfs ${HOME}/.config/tmux/tmux.conf ${HOME}/.tmux.conf

# source $(setup_dir)/nvm.sh

# task warrior 
# rm ${HOME}/.taskrc
# ln -s ${HOME}/.config/task/rc ${HOME}/.taskrc

# VIT
# ln -s ${HOME}/.config/vit ${HOME}/.vit

# Mutt
# rm ${HOME}/.mailcap
# ln -s ${HOME}/.config/mailcap ${HOME}/.mailcap

# rm ${HOME}/.muttrc
# ln -s ${HOME}/.config/mutt/rc ${HOME}/.muttrc

# Timewarrior
# mkdir -p ${HOME}/.timewarrior
# ln -s ${HOME}/.config/timewarrior ${HOME}/.timewarrior/timewarrior.cfg

# source $(setup_dir)/bluetooth.sh
# source $(setup_dir)/services.sh 
# source $(setup_dir)/pip.sh 
# source $(setup_dir)/backlight.sh

# time sync
# timedatectl set-ntp true 
