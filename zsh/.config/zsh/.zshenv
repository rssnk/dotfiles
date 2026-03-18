# add .local/bin if it lacks from PATH
[[ "$PATH" == */.local/bin* ]] || PATH="$PATH:$HOME/.local/bin"

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
HISTCONTROL=ignoreboth
SAVEHIST=10000
KEYTIMEOUT=1 # for quick vi mode switching

# default apps
export TERM=st-256color
# export TERM=xterm-256color
export TERMINAL=$TERM
export EDITOR=nvim
export FCEDIT=$EDITOR

# paging
export MANPAGER=moar
export PAGER=moar
export MOAR='-no-statusbar -wrap'

# misc
export GTK_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME=qt6ct
export GOPATH=$HOME/dev/go
# add go binaries to path
[[ "$PATH" == *$GOPATH/bin* ]] || PATH="$PATH:$GOPATH/bin"
# export CARGO_HOME=$HOME/dev/cargo
# # add cargo binaries to path
# [[ "$PATH" == *$CARGO_HOME/bin* ]] || PATH="$PATH:$CARGO_HOME/bin"

# fzf
export FZF_DEFAULT_OPTS="--reverse --style=minimal -m --no-scrollbar"
export FZF_CTRL_T_COMMAND="fd . $HOME --type f -H -E '.steam*'"
