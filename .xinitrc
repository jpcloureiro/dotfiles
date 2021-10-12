#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#  start redshift if not running already
pgrep redshift &> /dev/null || redshift &> /dev/null &
#  start thunar daemon if not running already
pgrep thunar --daemon &> /dev/null || thunar --daemon &> /dev/null &

# keyboard configs
xset b off
xset r rate 200 30
setxkbmap -option caps:escape_shifted_capslock

# path adds
PIP_BIN=$HOME/.local/bin
export PATH=$PATH:$PIP_BIN

# misc exports
export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1
export XDG_SESSION_TYPE=X11

# rotate secodary screen 90 degrees to the right
xrandr --output DVI-D-0 --rotate right

# clipboard manager daemon
clipmenud &

# notifications daemon
dunst &

# terminal emulator urxvt daemon
urxvtd -q -f -o

# execute i3 window manager
exec /usr/bin/i3
