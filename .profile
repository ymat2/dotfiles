# Source global definitions
[ -f /etc/profile ] && . /etc/profile

# set PATH so it includes user's bin if it exists
if [ -d $HOME/bin ]; then
  PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/.local/bin ]; then
  PATH=$HOME/.local/bin:$PATH
fi

# set PATH so it includes linuxbrew if it exists
if [ -d /home/linuxbrew/.linuxbrew ]; then
	if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
		PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	fi
	if [ -d /home/linuxbrew/.linuxbrew/sbin ]; then
		PATH=/home/linuxbrew/.linuxbrew/sbin:$PATH
	fi
fi

# settings for pyenv, goenv, rbenv, nodebrew
if [ -d $HOME/.pyenv ]; then
	export PYENV_ROOT=$HOME/.pyenv
	command -v pyenv >/dev/null || export PATH=$PYENV_ROOT/bin:$PATH
	eval "$(pyenv init -)"
fi

if [ -d $HOME/.goenv ]; then
	export GOENV_ROOT=$HOME/.goenv
	command -v goenv >/dev/null || export PATH=$GOENV_ROOT/bin:$PATH
	eval "$(goenv init -)"
	PATH=$GOENV_ROOT/shims:$GOROOT/bin:$PATH:$GOPATH/bin
fi

[ -d $HOME/.rbenv ] && eval "$(rbenv init -)"
[ -d $HOME/.nodebrew/current/bin ] && PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH
