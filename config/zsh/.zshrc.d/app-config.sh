#!/bin/bash

# Add path in $PATH if exists
addpath() {
    if [[ -d "$1" ]]; then
        export PATH="$1:$PATH"
    fi
}

# Add to the end of path in $PATH if exists
addpath_end() {
    if [[ -d "$1" ]]; then
        export PATH="$PATH:$1"
    fi
}

##
## UV config
##
# Completions are lazy-loaded from ~/.oh-my-zsh/custom/completions/_uv and _uvx
# (regenerate with: uv generate-shell-completion zsh > ~/.oh-my-zsh/custom/completions/_uv
#                    uvx --generate-shell-completion zsh > ~/.oh-my-zsh/custom/completions/_uvx)

##
## PIXI (PYTHON)
##
addpath "$HOME/.pixi/bin"
# Completion is lazy-loaded from ~/.oh-my-zsh/custom/completions/_pixi
# (regenerate with: pixi completion --shell zsh > ~/.oh-my-zsh/custom/completions/_pixi)

# Set the python breakpoint to use ipdb
# (WARNING, this must be installed).
export PYTHONBREAKPOINT=ipdb.set_trace

##
## GO
##
go_path="/usr/local/go/bin"
if [[ -d "$go_path" ]]; then
    addpath "$go_path"
    export GOPATH="$HOME/.go-projects"
    export GOBIN="$GOPATH/bin"
    addpath "$GOBIN"
fi

##
## CARGO config
##
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

##
## FZF CONFIG
##
fzf_sh="$HOME/.fzf.zsh"
if [ -f "$fzf_sh" ]; then
    source "$fzf_sh"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

##
## TEXLIVE (LaTeX)
##
addpath_end "$HOME/.texlive/bin/x86_64-linux"
if [ -d ~/.texmf ]; then
    export TEXMFHOME=~/.texmf
fi

##
## FNM (Javascript)
##
FNM_PATH="/home/etienne/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env --shell zsh --use-on-cd)"
fi

##
## KUBECTL (K8S)
##
alias k=kubectl
compdef k=kubectl
