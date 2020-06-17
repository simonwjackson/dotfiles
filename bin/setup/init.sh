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
  echo -e "\n$(tput setaf 2)$1$(tput sgr0)"
}

inform() {
  echo -e "\n$(tput setaf 6)$1$(tput sgr0)"
}

warning() {
  echo -e "\n$(tput setaf 1)$1$(tput sgr0)"
}

input() {
  echo -e "\n$(tput setaf 6)$1$(tput sgr0)\c"
}

[[ -f "/etc/arch-release" ]] || warning "This is not an Arch Linux based system. Things may break.."

[[ -z "${USER}" ]] && USER=$(whoami)

pacman \
  --sync \
  --needed \
  --refresh \
  --noconfirm \
  pacman-contrib

inform "Sorting your pacman mirror list. This may take a moment.."
cat /etc/pacman.d/mirrorlist \
  | rankmirrors - \
  | tee /etc/pacman.d/mirrorlist \
  > /dev/null

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

# SSH
inform "Harden SSH"
SSH_CONFIG=/etc/ssh/sshd_config

sed -i 's/#\?\(PerminRootLogin\s*\).*$/\1 no/' "${SSH_CONFIG}"
sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' "${SSH_CONFIG}"
sed -i 's/#\?\(PermitEmptyPasswords\s*\).*$/\1 no/' "${SSH_CONFIG}"
sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 no/' "${SSH_CONFIG}"
  
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

# Add user to sudoers. Don't require password
printf "${USER} ALL=(ALL) NOPASSWD:ALL\n" | tee -a /etc/sudoers

inform "Installing yay.."
if ! [ -x "$(command -v yay)" ]; then
  pacman \
    --sync \
    --needed \
    --noconfirm \
      libffi \
      base-devel \
      procps-ng \
      go
      
  useradd builduser -m && \
    passwd -d builduser && \
    printf 'builduser ALL=(ALL) ALL' | tee -a /etc/sudoers > /dev/null && \
      
    sudo -u builduser bash -c '\
      TMP_YAY=$(mktemp --directory); \
      git clone https://aur.archlinux.org/yay.git "${TMP_YAY}"; \
      cd "${TMP_YAY}"; \
      makepkg \
        --syncdeps \
        --install \
        --noconfirm; \
      rm -rdf "${TMP_YAY}"; \
    '
  userdel -r builduser
  sed -i '$ d' /etc/sudoers
fi

GIT_HOME="${HOME}/.git"

if git -C "${HOME}" rev-parse --git-dir > /dev/null 2>&1; then
  if ! [ -z "$(git --git-dir ${GIT_HOME} status --untracked-files=no --porcelain)"]; then
    warning "Home (${HOME}) is not clean! exiting.."
    exit 1
  fi
fi

TMP_DOTFILES=$(sudo -u "${USER}" mktemp --directory)
sudo -u "${USER}" git clone https://github.com/simonwjackson/dotfiles.git "${TMP_DOTFILES}"

rm -rdf "${GIT_HOME}"
rsync \
  --verbose \
  --archive \
  --recursive \
  "${TMP_DOTFILES}/" "${HOME}"

rm -rdf ${TMP_DOTFILES}

inform "Starting user centric installation.."
sudo \
  -u "${USER}" \
  bash -c "${HOME}/bin/setup/user/init.sh"

inform "Removing unused packages.."
pacman \
  --remove \
  --native \
  --recursive \
  $(pacman --query --unrequired --nodeps --quiet)
