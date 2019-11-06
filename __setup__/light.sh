#!/bin/bash

cd $HOME

# Get light
wget https://github.com/haikarainen/light/releases/download/v1.2/light-1.2.tar.gz

# Untar it.
tar xf light-1.2.tar.gz

# Rename and move into
mv light-1.2/ .light/
cd .light/

# Configure and install
./configure --with-udev=/etc/udev/rules.d && make
sudo make install

# Add the user to ideo group
sudo usermod -aG video $USERi

echo 'Please reboot the computer.'
