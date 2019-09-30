#!/usr/bin/zsh

# Enable SSH
sudo systemctl enable sshd
sudo systemctl start sshd

# Bugwarrior
systemctl --user enable bugwarrior-pull.timer
systemctl --user start bugwarrior-pull.timer
