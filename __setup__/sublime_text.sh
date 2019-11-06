#!/bin/bash

## Install Sublime-text-3 (cf ubuntu doc)
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
 
# Stable version
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Install
sudo apt-get update
sudo apt-get install sublime-text

## Re-launch .zshrc for PATH location and launch sublime_text for config file init.
source $HOME/.zshrc
sublime_text


## Instalation root
CUR_DIR=`pwd`
DIR="$HOME/.config/sublime-text-3/Packages"

## Install plugins

cd $DIR

# Install Package Control
wget -O "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" https://packagecontrol.io/Package%20Control.sublime-package
# git clone https://github.com/wbond/package_control.git "Package Control"

# AlignTab
git clone https://github.com/randy3k/AlignTab.git

# SublimeLinter
# Global Linter
git clone https://github.com/SublimeLinter/SublimeLinter.git
# flakes8 for python
pip3 install flake8
git clone https://github.com/SublimeLinter/SublimeLinter-flake8.git
# chktex for LaTeX
git clone https://github.com/SublimeLinter/SublimeLinter-chktex.git

# TrailingSpaces
git clone https://github.com/SublimeText/TrailingSpaces.git

# PythonPEP8 Autoformat
git clone https://github.com/gsemet/pythonpep8autoformat.git

# WordCount
git clone https://github.com/titoBouzout/WordCount.git WordCount 

