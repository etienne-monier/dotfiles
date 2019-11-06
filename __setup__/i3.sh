#!/bin/bash -
#===============================================================================
#
#          FILE: i3.sh
#
#         USAGE: ./i3.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 23/07/2019 10:20:52
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

## Install i3wm
sudo apt-get install i3

## Install compton
sudo apt-get install compton

## Install misc
sudo apt-get install xfce4-screenshooter xautolock

## Install rofi
sudo apt-get install rofi

## Install feh for background
sudo apt-get install feh

