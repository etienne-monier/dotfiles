#!/bin/bash -
#===============================================================================
#
#          FILE: polybar.sh
#
#         USAGE: ./polybar.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 23/07/2019 10:36:28
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

if [ ! -d "$HOME/.polybar" ]; then

    ## Dependencies
    sudo apt-get -y install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 libjsoncpp-dev
    
    ## Clone polybar
    cd $HOME
    git clone https://github.com/jaagr/polybar.git

    ## Install
    mv polybar .polybar && cd .polybar && ./build.sh

fi

