#!/bin/bash

# Set environment variables related to the HTTP(S) proxy
active_con=$(LC_ALL=C nmcli c show --active | grep -cE '(ethernet|wireless|wifi)' 2>/dev/null)
if [ $active_con -gt "0" ]; then
  if host -W 2 proxy2.si.c-s.fr &>/dev/null; then
    . /etc/proxy-credentials
  fi
fi

export TSOCKS_CONFFILE="$HOME/.tsocks.conf"

alias snc='( cd "$HOME/.vpn/icc-user" && sudo openvpn vpn-cnes1-UDP4-1195-moniere.ovpn )'
alias snc-admin='( cd "$HOME/.vpn/icc-admin" && sudo openvpn vpn-cnes1-UDP4-1194-moniere.ovpn )'
