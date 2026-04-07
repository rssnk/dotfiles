alias sorc='source $ZDOTDIR/.zshrc'
alias soenv='source $ZDOTDIR/.zshenv'

alias xbps-install='sudo xbps-install -S'
alias xbps-remove='sudo xbps-remove'
alias uxbps='yes | sudo xbps-install -u xbps && yes | sudo xbps-install -Su'

alias ls='ls --color=auto'
alias l='ls -oght --color=auto'
alias ll='ls -oghtA --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color'
alias cp='cp -iv'
alias mv='mv -v'
alias rm='rm -v'
alias pgrep='pgrep -l'
alias pkill='pkill -e'

alias ff='fastfetch -l sparky --logo-color-1 white --color magenta'
alias audio='pkill wireplumber && pkill pipewire && sleep 0.3 && ( pipewire &> /dev/null & )'
alias pagent-start='( $HOME/downloads/postman_agent/postman_agent &> /dev/null & ) && echo postman agent started'
alias pagent-kill='pkill -e "postman-agent|postman_agent"'

alias fehview='feh -g 800x600 --scale-down --image-bg black --borderless'
