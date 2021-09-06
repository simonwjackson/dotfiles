# export BW_SESSION="$(cat "${HOME}/.secrets/bitwarden/session")"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export BROWSER="$(which qutebrowser)"
export EDITOR="$(which nvim)"

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96

export POLYBAR_HEIGHT=60

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  # HACK: Rotate and scale break without sleeping momentarily
  # Consider modifing the service file instead
  sleep 1
  startx
fi
