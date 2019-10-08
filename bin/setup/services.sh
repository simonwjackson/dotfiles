#!/usr/bin/zsh

# Enable SSH
sudo systemctl enable sshd
sudo systemctl start sshd

# Enable bluetooth
systemctl enable bluetooth.service
systemctl start bluetooth.service

# Bugwarrior
systemctl --user enable bugwarrior-pull.timer
systemctl --user start bugwarrior-pull.timer
