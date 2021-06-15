#!/bin/sh
# ~/.zprofile: executed by the command interpreter for login shells.

## Pyenv config -------------------------
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

## Sourcing .bashrc ---------------------
#
if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
	     . "$HOME/.zshrc"
    fi
fi

## PATH modification --------------------
#

addpath(){
  if [ -d "$1" ]; then
    export PATH="$PATH:$1"
  fi
}

## General programs
##

addpath "$HOME/bin"
addpath "$HOME/.local/bin"
addpath "/opt/TurboVNC/bin/"
addpath "$HOME/.mybin"

## Latex conf
##

if [ -d ~/.texmf ] ; then
    export TEXMFHOME=~/.texmf
fi

addpath "$HOME/.texlive/bin/x86_64-linux"
