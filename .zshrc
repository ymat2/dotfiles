PS1='%n@%m:%1~$ '

## setting history file and its size in zsh
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
setopt hist_ignore_dups

## setting aliases
alias ls='ls -GF'
alias ll='ls -alhGF'
alias la='ls -aGF'
alias rmi='rm -i'
alias gs='git status'
alias glog="git log --all --oneline --graph"
alias gadd='git add'
alias gcom='git commit'
alias gpsh='git push'

## source other settings
[ -f ~/.zsh_local ] && . ~/.zsh_local
[ -f ~/.profile ] && . ~/.profile
