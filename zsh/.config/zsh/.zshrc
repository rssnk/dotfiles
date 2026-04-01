setopt autocd       # if input is i directory cd in it
setopt extendedglob # extended pattern matches
setopt nomatch      # print error if patterns not matches
setopt notify       # notify about jobs imidiately
unsetopt beep

setopt globdots             # include dotfiles
setopt interactive_comments # allow comments in shell
setopt promptsp             # don't clean lines without newline at the end

setopt append_history inc_append_history share_history # better history

# disable accidental ctrl s
stty stop undef 

# enable emacs mode
bindkey -e
autoload -U select-word-style
select-word-style bash

# ctrl-g like in bash
# Define a widget to cancel the mark
function cancel-mark() {
    if [[ $REGION_ACTIVE -eq 1 ]]; then
        zle set-mark-command -n -1  # Deactivate the mark
    else
        zle send-break        # Behave like C-g in Emacs when no mark is active
    fi
}
zle -N cancel-mark
bindkey "^g" cancel-mark

# systemclipboard integration
x-copy-region-as-kill () {
    zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xclip -i -selection clipboard
}
x-backward-kill-line () {
    zle backward-kill-line
    print -rn -- $CUTBUFFER | xclip -i -selection clipboard
}
x-kill-region () {
    zle kill-region
    print -rn -- $CUTBUFFER | xclip -i -selection clipboard
}
x-yank () {
    CUTBUFFER=$(xclip -o -selection clipboard)
    zle yank
}
zle -N x-copy-region-as-kill
zle -N x-backward-kill-line
zle -N x-kill-region
zle -N x-yank

bindkey \\ew x-copy-region-as-kill
bindkey \^u x-backward-kill-line
bindkey \^w x-kill-region
bindkey \^y x-yank

# disable fwd-i-search
bindkey -r '^S'

# prompt
source $ZDOTDIR/prompt.zsh
# aliases
source $ZDOTDIR/aliases.zsh
# auto-completions
source $ZDOTDIR/completion.zsh

# fzf
source <(fzf --zsh)

# startx when logging in first tty
if [[ -z $DISPLAY  ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx &>/dev/null
fi
