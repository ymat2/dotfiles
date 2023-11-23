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
for prefix in /usr/local /home/linuxbrew/.linuxbrew $HOME/.homebrew; do
	[ -d $prefix/bin ] && PATH=$prefix/bin:$PATH
	[ -d $prefix/sbin ] && PATH=$prefix/sbin:$PATH
	[ -e $prefix/bin/brew ] && eval "$($(brew --prefix)/bin/brew shellenv)"
done

# settings for pyenv, goenv, rbenv, nodebrew
if [ -d $HOME/.pyenv ]; then
	export PYENV_ROOT=$HOME/.pyenv
	export PATH=$PYENV_ROOT/bin:$PATH
	eval "$(pyenv init -)"
fi

if [ -d $HOME/.goenv ]; then
	export GOENV_ROOT=$HOME/.goenv
	goenv_versions=($(ls $GOENV_ROOT/versions | sort -V))
	GOENV_LATEST=$GOENV_ROOT/versions/${goenv_versions[@]: -1}
	unset goenv_versions
	GOENV_SHIMS=$GOENV_ROOT/shims
	export PATH=$GOENV_LATEST/bin:$GOENV_SHIMS:$GOROOT/bin:$PATH
fi

if [ -d $HOME/.rbenv ]; then
	export RBENV_ROOT=$HOME/.rbenv
	export PATH=$RBENV_ROOT/bin:$PATH
	eval "$(rbenv init -)"
fi

[ -d $HOME/.nodebrew/current/bin ] && PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH
