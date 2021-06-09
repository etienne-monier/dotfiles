#!/bin/bash -

if [ ! -d "$HOME/.polybar" ]; then

    ## Dependencies
    sudo apt-get -y install cmake cmake-data libcairo2-dev libxcb1-dev \
      libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
      libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto \
      libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev \
      libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 \
      libjsoncpp-dev

    ## Clone polybar
    git clone https://github.com/polybar/polybar.git $HOME/.polybar

    # Compilation
    cd $HOME/.polybar
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)

    # Install package
    sudo make install

fi
