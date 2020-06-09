if [[ $- == *i* ]]; then # Interactiive shell? 
  if [[ -z "${GIT_NAME}" ]]; then
    input "Git Name: "
    read GIT_NAME < /dev/tty
  fi

  if [[ -z "${GIT_EMAIL}" ]]; then
    input "Git Email: "
    read GIT_EMAIL < /dev/tty
  fi

  if [[ -z "${GITHUB_USERNAME}" ]]; then
    input "Github Username: "
    read GITHUB_USERNAME < /dev/tty
  fi
fi

git config --global user.name "${GIT_NAME}"
git config --global user.email "${GIT_EMAIL}"
git config --global github.user "${GITHUB_USERNAME}"

source "${HOME}/bin/setup/arch.sh"
source "${HOME}/bin/setup/neovim.sh"

# ZSH
ln -nfs ${HOME}/.config/zsh/rc ${HOME}/.zshrc

# tmux
ln -nfs ${HOME}/.config/tmux/tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ${HOME}/.local/share/tmux/plugins/tpm

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
