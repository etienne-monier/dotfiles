#!/bin/sh
# ~/.zprofile: executed by the command interpreter for login shells.

## Sourcing .bashrc ---------------------
#
if [ -n "$ZSH_VERSION" ]; then
  if [ -f "$HOME/.zshrc" ]; then
    . "$HOME/.zshrc"
  fi
fi

## PATH modification --------------------
#

addpath() {
  if [ -d "$1" ]; then
    export PATH="$PATH:$1"
  fi
}

addpath "$HOME/bin"
addpath "$HOME/.local/bin"
addpath "$HOME/.mybin"

## Pyenv config -------------------------
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
