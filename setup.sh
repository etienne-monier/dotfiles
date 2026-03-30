#!/bin/bash

#
# CONFIGURATION
#

# Applications for all users (incl. root).
base=(
  'zsh'
  'vim'
)

# Applications for non-root users.
useronly=(
  'git'
  'i3'
  'autorandr'
  'compton'
  'polybar'
  'rofi'
  'ipython'
  'nvim'
  'vim'
  'kitty'
  'latexmk'
)

#
# SCRIPT
#

# The base scrict diractory name.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# The directory containing applications to deploy everywhere.
CONFIG_DIR=$SCRIPT_DIR/config

# Ensure all .sh are executable
find . -name "*.sh" -exec chmod +x {} \;

## Stowing files ---------------------------------------------------------------------
#

echo ""
echo "STOWING FILES"

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

## Stowing

USER=$(whoami)
echo ""
echo "Stowing apps for user: $USER"

# install apps available to local users and root
for app in ${base[@]}; do
  echo $app
  stowit "${HOME}" $app
done

# install only user space folders
if [[ ! "$(whoami)" = *"root"* ]]; then
  for app in ${useronly[@]}; do
    echo $app
    stowit "${HOME}" $app
  done
fi

echo ""
echo "##### ALL DONE"
