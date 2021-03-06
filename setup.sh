#!/bin/bash

# Ensure all .sh are executable
#
find . -name "*.sh" -exec chmod +x {} \;

# Generate the correct files to stow.
#
HOSTNAME=`hostname`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# i3wm
FOLDER="$DIR/config/i3/.config/i3"
cat $FOLDER/config.$HOSTNAME $FOLDER/config.base > $FOLDER/config
# zsh
FOLDER="$DIR/config/zsh/"
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
    'latexmk'
    'texstudio'
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr=$1
    app=$2
    # -v verbose
    # -R restow
    # -t target
    # --no-folding to prevent tree folding
    stow -R --no-folding -t ${usr} -d "config" ${app}
}

USER=`whoami`
echo ""
echo "Stowing apps for user: $USER"

# install apps available to local users and root
for app in ${base[@]}; do
    echo $app
    stowit "${HOME}" $app 
done

# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$(whoami)" = *"root"* ]]; then
        echo $app
        stowit "${HOME}" $app 
    fi
done

echo ""
echo "##### ALL DONE"

