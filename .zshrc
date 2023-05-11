PS1='%1~ $ '
cd ~/Desktop

## setting history file and its size in zsh
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
setopt hist_ignore_dups

## setting paths to softwares
export PATH="${HOME}/bin/sratoolkit.2.10.9-mac64/bin:$PATH"
export PATH="${HOME}/bin/RSEM-1.3.3/:$PATH"
export PATH="${HOME}/bin/hisat2-2.2.1/:$PATH"
export PATH="${HOME}/bin/CAFE/:$PATH"
export PATH="${HOME}/bin/trimal-trimAl/source/:$PATH"
export PATH="${HOME}/bin/iqtree-1.6.12-MacOSX/bin/:$PATH"
export PATH="${HOME}/bin/coffee/:$PATH"

## setting aliases
alias ls='ls -GF'
alias ll='ls -lGF'
alias la='ls -aGF'
alias rmi='rm -i'
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'
alias gs='git status'
alias gadd='git add'
alias gcom='git commit -m'
alias gpsh='git push'
