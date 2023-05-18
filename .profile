# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Source global definitions
[ -f /etc/profile ] && . /etc/profile

# set PATH so it includes user's bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
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

export PATH
