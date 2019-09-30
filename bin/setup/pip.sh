#!/usr/bin/zsh

cat ${HOME}/.config/packages/pip | xargs --max-lines=1 pip install --user 
