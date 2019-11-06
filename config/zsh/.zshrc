##
## ZSH config
##

# Path to your oh-my-zsh installation.
export ZSH="/home/etienne/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# To prevent warning for root_indicator
ZSH_DISABLE_COMPFIX=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  pyenv
  git
  zsh-autosuggestions
  colored-man-pages
  z
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/plugins/z/z.sh

##
## Plugin config
##

POWERLEVEL9K_MODE="nerdfont-complete"

# OS icon segment
POWERLEVEL9K_CUSTOM_UBUNTU_ICON="echo -e '\uf31b'"
POWERLEVEL9K_CUSTOM_UBUNTU_ICON_BACKGROUND=234
POWERLEVEL9K_CUSTOM_UBUNTU_ICON_FOREGROUND=196

# SSH segment
POWERLEVEL9K_SSH_ICON='\uf68c'

# Root indicator segment
POWERLEVEL9K_ROOT_ICON="\uf198"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=196
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=232

# Dir directory element
POWERLEVEL9K_DIR_HOME_BACKGROUND=39
POWERLEVEL9K_DIR_HOME_FOREGROUND=232
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=39
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=232
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=39
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=232
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_first_and_last"

# Background job segment
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=232
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=178

# Status bar segment
POWERLEVEL9K_STATUS_OK_BACKGROUND=232
POWERLEVEL9K_STATUS_OK_FOREGROUND=46
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=232
POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196

# Time segment
POWERLEVEL9K_TIME_FORMAT="%D{\ue383 %H:%M \uf073 %d.%m.%y}"
POWERLEVEL9K_TIME_FOREGROUND=232

# Multiline prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n\u256d\u2500 "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "

# Pyenv segment

POWERLEVEL9K_PYTHON_ICON="\ue235"
POWERLEVEL9K_VIRTUALENV_BACKGROUND=128 # 165
POWERLEVEL9K_VIRTUALENV_FOREGROUND=232

#
# Segments config

# Left segments
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  # SSH connection
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_ubuntu_icon ssh context root_indicator dir vcsi virtualenv)
else
  # No SSH connection
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_ubuntu_icon root_indicator dir vcs virtualenv)
fi

# Right segments
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)


##
## User configuration
##

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# Color 256
export TERM='xterm-256color'

# History configuration
HISTSIZE=3000     # Nb de lignes en mémoire
HISTFILE=~/.zsh_history   # Fichier de sauvegarde
SAVEHIST=3000     # Nb d'entrées à enregistrer
HISTDUP=erase     # Suppression des doublons
setopt  appendhistory   # Ajout des entrées en mode append
setopt  sharehistory    # Partage de l'historique entre les terminaux
setopt  incappendhistory  # Ajout immédiat de l'historique (pas à la fermeture)

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

## Aliases
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

# ipython default profile
alias ipython='ipython3 --profile=dev'
alias ipython3='ipython3 --profile=dev'

#
# Config specific to etienne-IRIT
#
#

# Printing conf
alias lp='lp -o media=A4 -d laseri2eme-color -o fit-to-page -o Duplex=DuplexNoTumble' 

## PATH
##

## Path modification
export PATH=$PATH:$HOME/.matlab2017/bin/            # Add Matlab to the path
export PATH=$PATH:$HOME/.mycodes/                   # Add personal bash codes
export PATH=$PATH:$HOME/ownCloud/github/PyXport/    # Add plotdat
export PATH=$PATH:/opt/sublime_text/

## Python Path modification
export PYTHONPATH="$PYTHONPATH:/home/etienne/.mypython3"
export PYTHONPATH="$PYTHONPATH:/home/etienne/ownCloud/github/pystem-dev"
export PYTHONPATH="$PYTHONPATH:/home/etienne/ownCloud/github/pyxport"
export PYTHONPATH="$PYTHONPATH:/home/etienne/ownCloud/github/Unmixing"
export PYTHONPATH="$PYTHONPATH:/home/etienne/ownCloud/github/PyModules"


## pyenv conf
##

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PYTHONIOENCODING="utf-8"

if command -v pyenv 1>/dev/null 2>&1; then
    if [ -z ${PROFILE_LOADED} ]; then
        export PROFILE_LOADED=true
        eval "$(pyenv virtualenv-init -)"
        eval "$(pyenv init -)"
    fi
fi

## Latex conf
##

if [ -d ~/.texmf ] ; then
    export TEXMFHOME=~/.texmf
fi

export PATH="$HOME/.texlive/2019/bin/x86_64-linux:$PATH"