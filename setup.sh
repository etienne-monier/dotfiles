#!/bin/bash

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

# Ensure all .sh are executable
find . -name "*.sh" -exec chmod +x {} \;

# Generate host-specific files to be stowed.
#

# The base scrict diractory name.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# The directory containing applications to deploy everywhere.
CONFIG_DIR=$SCRIPT_DIR/config
# The application files to deploy according to hostname.
HOST_BUILD_DIR=$SCRIPT_DIR/host-specific-build

remove_pre_post(){
    echo $1 | sed -E "s/.base-(pre|post)//g"
}

add_to_file(){
    # add_to_file input_file dest_file
    if [[ -f $1 ]]; then
        cat $1 >> $2
    fi
}

# The files to process.
FILES_TO_BUILD=$(find $HOST_BUILD_DIR \( -name "*.base-pre" -o -name "*.base-post" \) | while read file; do remove_pre_post "$file"; done)

# Remove .gitignore to update destination files to ignore
rm $SCRIPT_DIR/.gitignore
echo "# Remove host-specific files" >> $SCRIPT_DIR/.gitignore

# Process files
for file in $FILES_TO_BUILD; do
    # Get the destination file location
    destination_file=$(echo $file | sed "s/host-specific-build/config/")
    # remove destination file
    rm -f $destination_file

    # Add host-specific and base files to destination file.
    add_to_file "$file.base-pre" $destination_file
    add_to_file "$file.$(hostname)" $destination_file
    add_to_file "$file.base-post" $destination_file

    # Add destination file to .gitignore
    echo $destination_file | sed "s#$SCRIPT_DIR/##" >> $SCRIPT_DIR/.gitignore

done


## Stowing files
#

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
