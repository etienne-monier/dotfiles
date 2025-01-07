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

#
# SCRIPT
#

# The base scrict diractory name.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# The directory containing applications to deploy everywhere.
CONFIG_DIR=$SCRIPT_DIR/config

# The application files to deploy according to hostname.
HOST_BUILD_DIR=$SCRIPT_DIR/host-specific-build

# Ensure all .sh are executable
find . -name "*.sh" -exec chmod +x {} \;

# Generate host-specific files to be stowed. -------------------------------------
#

remove_pre_post() {
  # Remove .base-pre or .base-post from input string.
  echo $1 | sed -E "s/.base-(pre|post)//g"
}

# The files to process.
FILES_TO_BUILD=$(find $HOST_BUILD_DIR \( -name "*.base-pre" -o -name "*.base-post" \) | while read filepath; do remove_pre_post "$filepath"; done | sort | uniq)

# Overwrite .gitignore to update destination files to ignore
cat <<EOF >"$SCRIPT_DIR/.gitignore"
# Files to hide
hosts.md
*PO20212LXe

# Remove host-specific files
EOF

add_to_file() {
  # Usage: add_to_file file1 file2
  #
  # Append FILE1 content into FILE2 if FILE1 exists.
  #
  if [[ -f $1 ]]; then
    cat $1 >>$2
  fi
}

echo "BUILDING HOST-SPECIFIC FILES"

for file in $FILES_TO_BUILD; do
  # Printing some information
  relative=$(echo $file | sed "s;$SCRIPT_DIR/;;")
  echo "  +- $relative"

  # Get the destination file location
  destination_file=$(echo $file | sed "s/host-specific-build/config/")
  # remove destination file
  rm -f $destination_file

  # Add host-specific and base files to destination file.
  add_to_file "$file.base-pre" $destination_file
  add_to_file "$file.$(hostname)" $destination_file
  add_to_file "$file.base-post" $destination_file

  # Add destination file to .gitignore
  echo $destination_file | sed "s#$SCRIPT_DIR/##" >>$SCRIPT_DIR/.gitignore

done

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
for app in ${useronly[@]}; do
  if [[ ! "$(whoami)" = *"root"* ]]; then
    echo $app
    stowit "${HOME}" $app
  fi
done

echo ""
echo "##### ALL DONE"
