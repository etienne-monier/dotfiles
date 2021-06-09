#!/bin/bash -

## Install Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install pluggins
vim +PluginInstall +qall
