cd  $HOME

git config --global user.name "Simon W. Jackson"
git config --global github.user simonwjackson
git config --global user.email "hello@simonwjackson.io"

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
rm $HOME/.mozilla/firefox/default/chrome
ln -s $HOME/.config/mozilla/firefox/default/chrome $HOME/.mozilla/firefox/default/chrome
rm $HOME/.mozilla/firefox/profiles.ini
ln -s $HOME/.config/mozilla/firefox/profiles.ini $HOME/.mozilla/firefox/profiles.ini

# ZSH

rm $HOME/.zshrc
ln -s $HOME/.config/zsh/rc $HOME/.zshrc

# Git

### Empty

# NeoVim

nvim +PlugInstall +qa
git config --global core.editor "nvim"

# NVM

## install latest version
source /usr/share/nvm/init-nvm.sh
nvm install node

## global eslint is required for vim-ale :(
npm i -g eslint

# task warrior 
rm $HOME/.taskrc
ln -s .config/task/rc $HOME/.taskrc

# Mutt
rm $HOME/.mailcap
ln -s $HOME/.config/mailcap $HOME/.mailcap

rm $HOME/.muttrc
ln -s $HOME/.config/mutt/rc $HOME/.muttrc
