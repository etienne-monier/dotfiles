#!/bin/sh

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

## Sourcing .zshrc ---------------------
#
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

## PATH modification --------------------
#

addpath() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}

addpath "$HOME/bin"
addpath "$HOME/.local/bin"
addpath "$HOME/.mybin"

## Cargo config -------------------------
#
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
