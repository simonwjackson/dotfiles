[[ -e "${HOME}/.zshenv" ]] && source "${HOME}/.zshenv"

# if [[ "$(ps -o comm= -p $PPID)" == "sshd" ]]; then
#     # inside an ssh session
#     tmux new-session -s default
# elif [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
   startx
fi
