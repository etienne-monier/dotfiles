#!/bin/bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# Ensure all .sh are executable
#
find . -name "*.sh" -exec chmod +x {} \;

# Generate the correct files to stow.
#
HOSTNAME=`hostname`

# i3wm
FOLDER="$HOME/.dotfiles/config/i3/.config/i3"
cat $FOLDER/config.$HOSTNAME $FOLDER/config.base > $FOLDER/config
# zsh
FOLDER="$HOME/.dotfiles/config/zsh/"
cat $FOLDER/.zshrc.base $FOLDER/.zshrc.$HOSTNAME > $FOLDER/.zshrc


# what directories should be installable by all users including the root user
base=(
    'zsh'
)

# folders that should, or only need to be installed for a local user
useronly=(
    'git'
    'i3'
    'compton'
    'matplotlib'
    'polybar'
    'rofi'
    'sublime-text'
    'ipython'
    'vim'
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr=$1
    app=$2
    # -v verbose
    # -R restow
    # -t target
    # --no-folding to prevent tree folding
    stow -v -R --no-folding -t ${usr} -d "config" ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to local users and root
for app in ${base[@]}; do
    stowit "${HOME}" $app 
done

# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$(whoami)" = *"root"* ]]; then
        stowit "${HOME}" $app 
    fi
done

echo ""
echo "##### ALL DONE"

