#!/bin/bash

# cf https://gist.github.com/amanusk/6b79d407945ca79caa945ce2658fd987

# This script is intended to make switching between laptop and external displays easier when using i3+dmenu
# To run this script, map it to some shortcut in your i3 config, e.g:
# bindsym $mod+p exec --no-startup-id $config/display.sh
# IMPORTANT: run chmod +x on the script to make it executable
# The result is 4 options appearing in dmenu, from which you can choose



# This is your default laptop screen, detect by running `xrandr`
INTERNAL_OUTPUT="eDP-1"

# This is used to determine which external display you have connected
EXTERNAL_OUTPUT=$(xrandr | grep ' connected ' | grep -v $INTERNAL_OUTPUT | cut -f 1 -d ' ')

set_monitors(){
    # Wires a set of workspaces to a monitor.
    #
    # Input:
    #     - monitor name
    #     - workspaces selector
    # Workspaces selector:
    #     - (odd/even) for odd/even workspaces
    #     - all for all workspaces (default)

    # Get list of workspaces
    WORKSPACES=$(seq 1 10)
    case "$2" in
        odd) WORKSPACES=$(seq 1 2 10) ;;
        even) WORKSPACES=$(seq 2 2 10) ;;
    esac

    FOCUSED=$(i3-msg -t get_workspaces \
        | jq '.[] | select(.focused==true).name' \
        | cut -d"\"" -f2)
    VISIBLE=$(i3-msg -t get_workspaces \
        | jq '.[] | select(.visible==true).name' \
        | cut -d"\"" -f2)

    for i in $WORKSPACES
    do
        echo "Setting workspace $i"
        i3-msg "workspace $i"
        i3-msg "move workspace to output $1"
    done
    for i in $VISIBLE
    do
        i3-msg "workspace $i"
    done
    i3-msg "workspace $FOCUSED"

}

get_current_workspace(){
    echo "$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d \" -f2)"
}

set_workspace(){
    i3-msg "restart"
    i3-msg "workspace $1 output $2"
}

setup_laptop_only(){
    xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off
    # set_monitors $INTERNAL_OUTPUT "all"
    # set_workspace $CURR_WORKSPACE $INTERNAL_OUTPUT
}

setup_external_only(){
    xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary
    # set_monitors $EXTERNAL_OUTPUT "all"
    # set_workspace $CURR_WORKSPACE $EXTERNAL_OUTPUT
}

clone_monitor(){
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --mode 1920x1080 --same-as $INTERNAL_OUTPUT
}

dual_monitor(){
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --mode 1920x1080 --right-of $INTERNAL_OUTPUT --primary
    set_monitors $INTERNAL_OUTPUT "odd"
    set_monitors $EXTERNAL_OUTPUT "even"
}


# choices will be displayed in dmenu
choices="laptop\ndual\nexternal\nclone"

# Your choice in dmenu will determine what xrandr command to run
chosen=$(printf $choices | dmenu -i)


# CURR_WORKSPACE=$(get_current_workspace)

case "$chosen" in
    external) setup_external_only ;;
    laptop) setup_laptop_only ;;
    clone) clone_monitor ;;
    dual) dual_monitor ;;
esac










# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     echo "monitor : $MONITOR"
#     MONITOR=$m polybar --reload cslaptop >> /dev/null &
#   done
# else
#   polybar --reload cslaptop >> /dev/null &
# fi

#i3-msg 'restart'
