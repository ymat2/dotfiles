# Source global definitions
[ -f /etc/profile ] && . /etc/profile

# set PATH so it includes user's bin if it exists
if [ -d $HOME/bin ]; then
  PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/.local/bin ]; then
  PATH=$HOME/.local/bin:$PATH
fi

# set PATH for homebrew
for prefix in /usr/local /usr /home/linuxbrew/.linuxbrew $HOME/.homebrew; do
	[ -e $prefix/bin/brew ] && PATH=$prefix/bin:$PATH
	[ -e $prefix/sbin/brew ] && PATH=$prefix/sbin:$PATH
done

# settings for pyenv, goenv, rbenv, nodebrew
if [ -d $HOME/.pyenv ]; then
	export PYENV_ROOT=$HOME/.pyenv
	export PATH=$PYENV_ROOT/bin:$PATH
	eval "$(pyenv init -)"
fi

if [ -d $HOME/.goenv ]; then
	export GOENV_ROOT=$HOME/.goenv
	export PATH=$GOENV_ROOT/bin:$PATH
	eval "$(goenv init -)"
	PATH=$GOENV_ROOT/shims:$GOROOT/bin:$PATH:$GOPATH/bin
fi

if [ -d $HOME/.rbenv ]; then
	export RBENV_ROOT=$HOME/.rbenv
	export PATH=$RBENV_ROOT/bin:$PATH
	eval "$(rbenv init -)"
fi

[ -d $HOME/.nodebrew/current/bin ] && PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH
