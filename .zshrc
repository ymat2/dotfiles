PS1='%1~ $ '
cd ~/Desktop

## setting history file and its size in zsh
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
setopt hist_ignore_dups

## setting aliases
alias ls='ls -GF'
alias ll='ls -lGF'
alias la='ls -aGF'
alias rmi='rm -i'
alias gs='git status'
alias gadd='git add'
alias gcom='git commit -m'
alias gpsh='git push'

## source locals settings
[ -f ~/.zsh_local ] && . ~/.zsh_local
