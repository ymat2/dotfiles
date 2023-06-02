# Source global definitions
[ -f /etc/profile ] && . /etc/profile

# set PATH so it includes user's bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes linuxbrew if it exists
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
	if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
		PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
	fi
	if [ -d "/home/linuxbrew/.linuxbrew/sbin" ]; then
		PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
	fi
fi

# pyenv, renv
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi

[ -d "$HOME/.rbenv" ] && eval "$(rbenv init -)"


export PATH
