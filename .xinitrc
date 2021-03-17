pgrep redshift &> /dev/null || redshift &> /dev/null &
pgrep thunar --daemon &> /dev/null || thunar --daemon &> /dev/null &

xset b off
xrdb ~/.Xresources
setxkbmap -option caps:escape_shifted_capslock

PIP_BIN=$HOME/.local/bin
export PATH=$PATH:$PIP_BIN

export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1
exec i3
