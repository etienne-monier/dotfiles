#!/bin/sh

##
## Setup Powerlevel10k
##

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zshrc.d/p10k.zsh ]] || source ~/.zshrc.d/p10k.zsh


##
## OH MY ZSH config
##

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# To prevent warning for root_indicator
ZSH_DISABLE_COMPFIX=true
RM_STAR_SILENT=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  pyenv
  git
  zsh-autosuggestions
  zsh-completions
  colored-man-pages
  z
  zsh-syntax-highlighting
)
autoload -U compinit && compinit

# If non-root, add ssh-agent
if [[ $EUID -ne 0 ]]; then
  plugins+=( ssh-agent )
fi

## Config for root user
if [[ $EUID -eq 0 ]]; then
  # Disable oh-my-zsh update
  DISABLE_AUTO_UPDATE="true"

  # Disable gitstatus init powerlevel10k
  POWERLEVEL9K_DISABLE_GITSTATUS=true
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/plugins/z/z.sh


# To set ssh agent quiet
ZSH_SSH_AGENT_QUIET=true

# Load SSH key
zstyle :omz:plugins:ssh-agent quiet identities id_rsa-cnes

##
## SHELL configuration
##

# History configuration
HISTSIZE=3000             # Nb de lignes en mémoire
HISTFILE=~/.zsh_history   # Fichier de sauvegarde
SAVEHIST=3000             # Nb d'entrées à enregistrer
HISTDUP=erase             # Suppression des doublons
setopt  appendhistory     # Ajout des entrées en mode append
setopt  sharehistory      # Partage de l'historique entre les terminaux
setopt  incappendhistory  # Ajout immédiat de l'historique (pas à la fermeture)

# Language environment
export LANG=fr_FR.UTF-8
# Color 256
export TERM='xterm-kitty'
# Prefered editor
export EDITOR=vim
# Pager (git logs)
export PAGER=cat

##
## ALIASES
##

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias rm='rm --preserve-root'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lc='colorls'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias gnome-control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias yt-dl='youtube-dl --verbose --user-agent "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.6533.103 Mobile Safari/537.36" --extract-audio --audio-format mp3'

# This function makes pipe accessible.
function mydu(){
  du -ah --max-depth=1 $1 | sort -h
}
alias mydu='mydu'

##
## INCLUDE environment-specific configuration
##

HOSTNAME=$(hostname)
HOSTFILE="${HOME}/.zshrc.d/host-specific/${HOSTNAME}.sh"

if [[ -f "${HOSTFILE}" ]]; then
  source "${HOSTFILE}"
fi

##
## Applications config
##

source "${HOME}/.zshrc.d/app-config.sh"

