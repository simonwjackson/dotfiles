#!/usr/bin/zsh

# Enable DHCP
sudo systemctl enable dhcpcd
sudo systemctl start dhcpcd

git config --global user.name "Simon W. Jackson"
git config --global github.user simonwjackson
git config --global user.email "hello@simonwjackson.io"

# Start a new git repository

git init

# Add the remote dotfiles repo

git remote add origin https://github.com/simonwjackson/dotfiles.git

# Pull and merge with local git

git pull origin +master
