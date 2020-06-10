#!/bin/sh

nvim -c "PlugInstall | qall!"
git config --global core.editor "nvim"
