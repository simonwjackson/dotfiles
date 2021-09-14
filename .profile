[[ -e "${HOME}/.zshenv" ]] && source "${HOME}/.zshenv"

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
export BW_SESSION="$(cat "${HOME}/.secrets/bitwarden/session")"
