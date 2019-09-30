#!/usr/bin/zsh

nvim -c "PlugInstall | qall"
git config --global core.editor "nvim"
