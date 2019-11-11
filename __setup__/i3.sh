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

## Install i3wm, compton, misc, rofi and feh
sudo apt-get -y install i3 compton xfce4-screenshooter xautolock rofi feh
