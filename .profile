# export BW_SESSION="$(cat "${HOME}/.secrets/bitwarden/session")"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export BROWSER="$(which qutebrowser)"

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96

export POLYBAR_HEIGHT=60

#[ "$(tty)" = "/dev/tty1" ] && startx