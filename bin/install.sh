pamac install --no-confirm $(cat ./.config/packages.install)
pamac build --no-confirm $(cat ./.config/packages.install.aur)
