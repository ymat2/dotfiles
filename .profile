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
if [ -z $HOMEBREW_PREFIX ]; then
  for prefix in /usr/local /opt/homebrew /home/linuxbrew/.linuxbrew $HOME/.homebrew; do
	  if [ -e $prefix/bin/brew ]; then
		  PATH=$prefix/bin:$PATH
	    eval "$($(brew --prefix)/bin/brew shellenv)"
		fi
  done
fi

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
	export PATH=$GOENV_LATEST/bin:$GOENV_SHIMS:$PATH
fi

if [ -d $HOME/.rbenv ]; then
	export RBENV_ROOT=$HOME/.rbenv
	export PATH=$RBENV_ROOT/bin:$PATH
	eval "$(rbenv init -)"
fi

[ -d $HOME/.nodebrew/current/bin ] && PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH
