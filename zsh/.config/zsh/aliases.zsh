alias sorc='source $ZDOTDIR/.zshrc'
alias soenv='source $ZDOTDIR/.zshenv'

alias xbps-install='sudo xbps-install -S'
alias xbps-remove='sudo xbps-remove'
alias uxbps='yes | sudo xbps-install -u xbps && sudo xbps-install -Su'

alias ls='ls --color=auto'
alias l='ls -oght --color=auto'
alias ll='ls -oghtA --color=auto'
alias grep='grep --color=always'
alias diff='diff --color'
alias cp='cp -iv'
alias mv='mv -v'
alias rm='rm -v'
alias pgrep='pgrep -l'
alias pkill='pkill -e'

alias fetch='fastfetch -l sparky --logo-color-1 white --color magenta'
alias pagent-start='( $HOME/downloads/postman_agent/postman_agent &> /dev/null & ) && echo postman agent started'
alias pagent-kill='pkill -e "postman-agent|postman_agent"'

alias fehview='feh -g 800x600 --scale-down --image-bg black --borderless'
alias clipboard='xclip -selection clipboard'

alias satan='fetch -l $HOME/documents/666.txt --logo-color-1 red --color-keys yellow'
