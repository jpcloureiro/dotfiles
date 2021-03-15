pgrep redshift &> /dev/null || redshift &> /dev/null &
pgrep thunar --daemon &> /dev/null || thunar --daemon &> /dev/null &
xrandr --output eDP1 --auto --output DP2-3 --auto --left-of eDP1
xset b off
xrdb ~/.Xresources
PIP_BIN=$HOME/.local/bin
export PATH=$PATH:$PIP_BIN
exec i3
