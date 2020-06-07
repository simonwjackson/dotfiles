#!/bin/sh

prompt() {
  read -r -p "$1 [y/N] " response < /dev/tty
  if [[ $response =~ ^(yes|y|Y)$ ]]; then
    true
  else
    false
  fi
}

confirm() {
  if [ "$FORCE" == '-y' ]; then
    true
  else
    read -r -p "$1 [y/N] " response < /dev/tty
    if [[ $response =~ ^(yes|y|Y)$ ]]; then
      true
    else
      false
    fi
  fi
}

success() {
  echo -e "$(tput setaf 2)$1$(tput sgr0)"
}

inform() {
  echo -e "$(tput setaf 6)$1$(tput sgr0)"
}

warning() {
  echo -e "$(tput setaf 1)$1$(tput sgr0)"
}

input() {
  echo -e "$(tput setaf 6)$1$(tput sgr0)\c"
}

[[ -f "/etc/arch-release" ]] || warning "This is not an Arch Linux based system. Things may break.."

[[ -z "${USER}" ]] && USER=$(whoami)

if [[ -z "${GIT_NAME}" ]]; then
  input "Git Name: "
  read GIT_NAME
fi

if [[ -z "${GIT_EMAIL}" ]]; then
  input "Git Email: "
  read GIT_EMAIL
fi

if [[ -z "${GITHUB_USERNAME}" ]]; then
  input "Github Username: "
  read GITHUB_USERNAME
fi

inform 'Updating system..'
pacman \
  --sync \
  --refresh \
  --sysupgrade \
  --needed \
  --noconfirm
  
inform 'Installing setup dependencies..'
pacman \
  --sync \
  --needed \
  --noconfirm \
    rsync \
    openssh \
    curl \
    sed \
    git \
    sudo
  
groupadd \
  --force \
  --gid 100 \
  users
  
useradd \
  --create-home \
  --no-user-group \
  "${USER}"
  
passwd \
  --delete \
  "${USER}"

HOME=$(getent passwd "${USER}" | cut -d: -f6)
GIT_HOME="${HOME}/.git"

# Add user to sudoers
printf "${USER} ALL = (ALL:ALL) ALL\n" | tee -a /etc/sudoers
  
if git -C "${HOME}" rev-parse --git-dir > /dev/null 2>&1; then
  if ! [ -z "$(git --git-dir "${GIT_HOME}" status --untracked-files=no --porcelain)"]; then
    echo "${HOME} is not clean! exiting.."
    exit 1
  fi
fi

git config --global user.name "${GIT_NAME}"
git config --global user.email "${GIT_EMAIL}"
git config --global github.user "${GITHUB_USERNAME}"

TMP_DOTFILES=$(sudo -u "${USER}" mktemp --directory)
sudo -u "${USER}" git clone https://github.com/simonwjackson/dotfiles.git "${TMP_DOTFILES}"

rm -rdf "${GIT_HOME}"
rsync --verbose --archive --recursive "${TMP_DOTFILES}/" "${HOME}"

rm -rdf ${TMP_DOTFILES}

success "Dotfiles have been cloned!"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

source "${SCRIPTPATH}/arch.sh"
# source "${SCRIPTPATH}/neovim.sh"

# ZSH
# ln -nfs ${HOME}/.config/zsh/rc ${HOME}/.zshrc
# chsh -s $(which zsh)

# tmux
# ln -nfs ${HOME}/.config/tmux/tmux.conf ${HOME}/.tmux.conf
# git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

# source ${HOME}/bin/setup/nvm.sh

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
# source ${HOME}/bin/setup/pip.sh
# source $(setup_dir)/backlight.sh

# time sync
# timedatectl set-ntp true

# Diff so fancy
# git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# git config --global color.ui true

# git config --global color.diff-highlight.oldNormal    "red bold"
# git config --global color.diff-highlight.oldHighlight "red bold 52"
# git config --global color.diff-highlight.newNormal    "green bold"
# git config --global color.diff-highlight.newHighlight "green bold 22"

# git config --global color.diff.meta       "11"
# git config --global color.diff.frag       "magenta bold"
# git config --global color.diff.commit     "yellow bold"
# git config --global color.diff.old        "red bold"
# git config --global color.diff.new        "green bold"
# git config --global color.diff.whitespace "red reverse"

# SSH
inform "Harden SSH"

SSH_CONFIG=/etc/ssh/sshd_config

sed -i 's/#\?\(PerminRootLogin\s*\).*$/\1 no/' "${SSH_CONFIG}"
sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' "${SSH_CONFIG}"
sed -i 's/#\?\(PermitEmptyPasswords\s*\).*$/\1 no/' "${SSH_CONFIG}"
sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 no/' "${SSH_CONFIG}"
