GIT_HOME="${HOME}/.git"

if git -C "${HOME}" rev-parse --git-dir > /dev/null 2>&1; then
  if ! [ -z "$(git --git-dir "${GIT_HOME}" status --untracked-files=no --porcelain)"]; then
    echo "${HOME} is not clean! exiting.."
    exit 1
  fi
fi

git config --global user.name "${GIT_NAME}"
git config --global user.email "${GIT_EMAIL}"
git config --global github.user "${GITHUB_USERNAME}"

TMP_DOTFILES=$(mktemp --directory)
git clone https://github.com/simonwjackson/dotfiles.git "${TMP_DOTFILES}"

rm -rdf "${GIT_HOME}"
rsync --verbose --archive --recursive "${TMP_DOTFILES}/" "${HOME}"

rm -rdf ${TMP_DOTFILES}

success "Dotfiles have been cloned!"

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
