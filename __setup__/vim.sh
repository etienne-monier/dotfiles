#!/bin/bash -
#===============================================================================
#
#          FILE: vim.sh
#
#         USAGE: ./vim.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 23/07/2019 10:50:37
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

## Install Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Some more info
echo "Done !"
echo "Extra info: after installing vim config, please run 'vim +PluginInstall +qall' in command line."

