# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


## Path modification
export PATH=$PATH:$HOME/.matlab2017/bin/            # Add Matlab to the path
export PATH=$PATH:$HOME/.mycodes/                   # Add personal bash codes
export PATH=$PATH:$HOME/ownCloud/github/PyXport/    # Add plotdat
export PATH=$PATH:/opt/sublime_text/


# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PYTHONIOENCODING="utf-8"


## Latex conf
##

if [ -d ~/.texmf ] ; then
    export TEXMFHOME=~/.texmf
fi

export PATH="$HOME/.texlive/2019/bin/x86_64-linux:$PATH"


