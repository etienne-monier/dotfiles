#!/bin/bash -
#===============================================================================
#
#          FILE: i3-gaps.sh
#
#         USAGE: ./i3-gaps.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 23/07/2019 10:25:41
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

cd $HOME

# Install dependencies
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev


if [ ! -d "$HOME/.i3-gaps" ]; then
    # clone the repository
    git clone https://www.github.com/Airblader/i3 i3-gaps
    mv i3-gaps .i3-gaps && cd .i3-gaps

    # compile & install
    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/

    # Disabling sanitizers is important for release versions!
    # The prefix and sysconfdir are, obviously, dependent on the distribution.
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make
    sudo make install

else
    echo 'i3-gaps already installed'

