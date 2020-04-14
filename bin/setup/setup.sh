#!/bin/sh

#$setup_dir=dirname $0

# source $(setup_dir)/_before.sh 
source ${HOME}/bin/setup/arch.sh 
source ${HOME}/bin/setup/neovim.sh
# source $(setup_dir)/firefox.sh

# ZSH
ln -nfs ${HOME}/.config/zsh/rc ${HOME}/.zshrc
# chsh -s $(which zsh)

# tmux
ln -nfs ${HOME}/.config/tmux/tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

source ${HOME}/bin/setup/nvm.sh

# task warrior 
rm ${HOME}/.taskrc
ln -s ${HOME}/.config/task/rc ${HOME}/.taskrc

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
source ${HOME}/bin/setup/pip.sh
# source $(setup_dir)/backlight.sh

# time sync
# timedatectl set-ntp true

# Diff so fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
