source "${HOME}/bin/setup/arch.sh"
source "${HOME}/bin/setup/neovim.sh"

# ZSH
ln -nfs ${HOME}/.config/zsh/rc ${HOME}/.zshrc

# tmux
ln -nfs ${HOME}/.config/tmux/tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

# NVM
source ${HOME}/bin/setup/nvm.sh

# Taskwarrior 
rm ${HOME}/.taskrc
ln -s ${HOME}/.config/task/rc ${HOME}/.taskrc

# Timewarrior
mkdir -p ${HOME}/.timewarrior
ln -s ${HOME}/.config/timewarrior ${HOME}/.timewarrior/timewarrior.cfg

# source $(setup_dir)/services.sh

# PIP
source ${HOME}/bin/setup/pip.sh

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
