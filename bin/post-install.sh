cd ~ 

git config --global github.user simonwjackson
# Start a new git repository

git init

# Add the remote dotfiles repo

git remote add origin https://github.com/simonwjackson/dotfiles.git

# Pull and merge with local git

git pull origin +master

# Install Apps

source $HOME/bin/install.sh

# Remove preinstalled apps and its non-shared dependencies

for P in $( < $HOME/.config/packages.remove )
do
    if (pacman -Qi ${P} > /dev/null)
    then
        pacman --remove --recursive --noconfirm ${P}
    fi
done

# Firefox

mkdir -p $HOME/.mozilla/firefox/default/
ln -s $HOME/.config/mozilla/firefox/default/chrome $HOME/.mozilla/firefox/default/chrome
ln -s $HOME/.config/mozilla/firefox/profiles.ini $HOME/.mozilla/firefox/profiles.ini

# ZSH

ln -s $HOME/.config/zsh/rc $HOME/.zshrc

# Git

### Empty

# NeoVim

nvim +PlugInstall +qa
git config --global core.editor "nvim"

# NVM

## install latest version
nvm install node

## global eslint is required for vim-ale :(
npm i -g eslint

# task warrior
ln -s .config/task/rc $HOME/.taskrc
ln -s $HOME/.config/mailcap $HOME/.mailcap
ln -s $HOME/.config/mutt/rc $HOME/.muttrc
