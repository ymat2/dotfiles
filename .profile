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

# settings for programming languages

if [ ! "`echo $PATH | grep '$HOME/.cargo/bin'`" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

if [ ! "`echo $PATH | grep '$HOME/.juliaup/bin'`" ]; then
  PATH=${HOME}/.juliaup/bin:${PATH}
fi

if [ -d ${HOME}/.local/go ]; then
  PATH=${HOME}/.local/go/bin:${PATH}
fi

if [ -d ${HOME}/go ]; then
  PATH=${HOME}/go/bin:${PATH}
fi


if [ -d $HOME/.rbenv ]; then
  export RBENV_ROOT=$HOME/.rbenv
  export PATH=$RBENV_ROOT/bin:$PATH
  eval "$(rbenv init -)"
fi

[ -d $HOME/.nodebrew/current/bin ] && PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH

if [ command -v uv > /dev/null 2>&1 && -d "${UV_PYTHON_INSTALL_DIR:=$(uv python dir)}" ]; then
  py_versions=($(ls "${UV_PYTHON_INSTALL_DIR}" | sort -V))
  export PY_LATEST=${UV_PYTHON_INSTALL_DIR}/${py_versions[@]: -1}
  PATH="${PY_LATEST}/bin:${PATH}"
  unset py_versions PY_LATEST
fi
