export PATH=$( find "${HOME}/.local/scripts" -type d -printf ":%p" ):$PATH
export BW_SESSION="$(cat "${HOME}/.secrets/bitwarden/session")"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export BROWSER="$(which qutebrowser)"
export EDITOR="$(which nvim)"

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96

export POLYBAR_HEIGHT=60

if [ -z "${DISPLAY}" ] \
    && [ "${XDG_VTNR}" -eq 1 ]; then
    # HACK: Rotate and scale break without sleeping momentarily
    # Consider modifing the service file instead
    sleep 1
    startx
elif command -v tmux &> /dev/null \
    && [ -n "$PS1" ] \
    && [[ ! "$TERM" =~ screen ]] \
    && [[ ! "$TERM" =~ tmux ]] \
    && [ -z "$TMUX" ]; then
    if [[ "$(ps -o comm= -p $PPID)" == "sshd" ]]; then
        # inside an ssh session
        tmux a -t default || tmux new -s default && exit;
    else
        # local session
        # TODO: Instruct tmux to hide top bar when local
        exec tmux new && exit;
    fi
fi
