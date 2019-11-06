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
echo -e "${BLUE}Installing Powerlevel9k theme ... ${NC}"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


##
## Font
##

## Hack Nerd Font font
echo -e "${BLUE}Installing hack font ... ${NC}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
mkdir hack
unzip Hack.zip -d hack
rm Hack.zip
sudo mv hack /usr/share/fonts/truetype
fc-cache -f -v

# Check installation
fc-list | grep 'Hack' >> /dev/null 
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Hack Nerd Font successfully installed ... ${NC}"
    HACHINST='OK'
else
    echo -e "${RED}Hack Nerd Font installation failed ... ${NC}"
    HACHINST='NO'
fi

## ls en couleur
# sudo apt-get install ruby ruby-dev rubygems libncurses5-dev
# sudo gem install colorls


## Logout and login to take into account
if [ "$HACKINST" == 'OK' ]; then
    echo -e "${GREEN}Installation was successful. Please logout and login to take installation into account.${NC}"
else
    echo -e "${RED}Installation failed. Hack Neired Font installation failed.${NC}"
fi





