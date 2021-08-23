#!/bin/bash

## Color for echo
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;33m'
NC='\033[0m' # No Color

##
## Install Shell
##

## Install zsh and check version
which zsh >> /dev/null
if [ ! $? -eq 0 ]; then
    echo -e "${BLUE}Installing zsh ... ${NC}"
    sudo apt install zsh
fi

## Change default shell
echo -e "${BLUE}Moving default shell to zsh ... ${NC}"
chsh -s $(which zsh)

##
## Oh my Zsh
##

## Install Oh My Zsh
echo -e "${BLUE}Installing oh-my-zsh ... ${NC}"
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## zsh-autosuggestions
echo -e "${BLUE}Installing oh-my-zsh autosugestions ... ${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## zsh-syntax-highlighting
echo -e "${BLUE}Installing oh-my-zsh syntax highlighting ... ${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


## Powerlevel9k theme
echo -e "${BLUE}Installing Powerlevel10k theme ... ${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


## Poetry
git clone https://github.com/darvid/zsh-poetry.git
DEST="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/poetry"
mkdir $DEST
mv zsh-poetry/poetry.plugin.zsh $DEST
rm -R zsh-poetry

##
## Font
##

## Hack Nerd Font font
echo -e "${BLUE}Installing hack font ... ${NC}"
git clone https://github.com/ryanoasis/nerd-fonts.git "$HOME:nerd-font"
cd nerd-font
git checkout v2.0
chmod +x install.sh
./install.sh
