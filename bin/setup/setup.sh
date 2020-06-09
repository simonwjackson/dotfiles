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

pacman \
  --sync \
  --needed \
  --refresh \
  --noconfirm \
  pacman-contrib

inform "Finding the fastest Arch mirrors.. This may take a few moments.."
cat /etc/pacman.d/mirrorlist \
| rankmirrors - \
| tee /etc/pacman.d/mirrorlist

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

if [[ -z "${HOME}" ]]; then
  useradd \
    --create-home \
    --no-user-group \
    "${USER}"
else
  useradd \
    --create-home \
    --no-user-group \
    --home "${HOME}" \
    "${USER}"
fi

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

sudo -u "${USER}" bash -c "${USER}/bin/setup/user/init.sh"

# SSH
inform "Harden SSH"
SSH_CONFIG=/etc/ssh/sshd_config

sed -i 's/#\?\(PerminRootLogin\s*\).*$/\1 no/' "${SSH_CONFIG}"
sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' "${SSH_CONFIG}"
sed -i 's/#\?\(PermitEmptyPasswords\s*\).*$/\1 no/' "${SSH_CONFIG}"
sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 no/' "${SSH_CONFIG}"

# Remove unused packages
pacman \
  --remove \
  --native \
  --recursive \
  $(pacman --query --unrequired --nodeps --quiet)
