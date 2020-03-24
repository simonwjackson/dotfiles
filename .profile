if ! [ -x "$(command -v tmux)" ]; then \
    curl -s \
      "https://raw.githubusercontent.com/simonwjackson/dotfiles/master/bin/dotfiles-cloner" \
      | sh &&
    sh ${HOME}/bin/setup/setup.sh && \
    # Switch to new shell \
    $(getent passwd $(id -un) | awk -F : '{print $NF}')
fi
