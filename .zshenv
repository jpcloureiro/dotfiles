# might not be needed anymore
export NODE_BINARY="$HOME/.nodenv/shims/node"

# android paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH
export JAVA_HOME=/usr/bin/java

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"

source "$ZDOTDIR/.zshenv"
