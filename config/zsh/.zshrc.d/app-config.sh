#!/bin/bash

# Add path in $PATH if exists
addpath() {
  if [[ -d "$1" ]]; then
    export PATH="$1:$PATH"
  fi
}

##
## NVIM
##
addpath "/opt/nvim/bin"

##
## GO
##
go_path="/usr/local/go/bin"
if [[ -d "$go_path" ]]; then
  addpath "$go_path"
  export GOPATH="$HOME/.go-projects"
  export GOBIN="$GOPATH/bin"
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
addpath "$HOME/.texlive/bin/x86_64-linux"
if [ -d ~/.texmf ]; then
  export TEXMFHOME=~/.texmf
fi

##
## NVM (Javascript)
##
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                 # This loads nvm
  [ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion" # This loads nvm zsh_completion
fi

##
## KUBECTL (K8S)
##
alias k=kubectl
complete -o default -F __start_kubectl k

##
## POETRY (PYTHON)
##
addpath "$HOME/.poetry/bin"

##
## PIXI (PYTHON)
##
addpath "$HOME/.pixi/bin"
eval "$(pixi completion --shell zsh)"

##
## PYENV config
##
if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  addpath "$PYENV_ROOT/bin"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Set the python breakpoint to use ipdb
# (WARNING, this must be installed).
export PYTHONBREAKPOINT=ipdb.set_trace

##
## CARGO config
##
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
