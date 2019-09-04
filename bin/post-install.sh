cd ~ 

# Start a new git repository

git init

# Add the remote dotfiles repo

git remote add origin https://github.com/simonwjackson/dotfiles.git

# Pull and merge with local git

git pull origin master

# Install Apps

pacman --sync --noconfirm --needed - < ~/.config/packages.install

# Remove preinstalled apps and its non-shared dependencies

for P in $( < ~/.config/packages.remove )
do
    if (pacman -Qi ${P} > /dev/null)
    then
        pacman --remove --recursive --noconfirm ${P}
    fi
done

# Firefox

mkdir -p ~/.mozilla/firefox/default/
ln -s ~/.config/mozilla/firefox/default/chrome ~/.mozilla/firefox/default/chrome
ln -s ~/.config/mozilla/firefox/profiles.ini ~/.mozilla/firefox/profiles.ini

# ZSH

ln -s ~/.config/zsh/rc ~/.zshrc

# Git

git config --global core.editor "nvim"
