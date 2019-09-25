pamac install --no-confirm $(cat ${HOME}/.config/packages.install)
pamac build --no-confirm $(cat ${HOME}/.config/packages.install.aur)
