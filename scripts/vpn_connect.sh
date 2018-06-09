#!/bin/bash
# Script to initialise a vpn
# 
# 1: Check if there is already a vpn connection and terminates
# 2: Initialises a new vpn connection with default configuration
#
# arg_1
#   configuration (/etc/vpnc/)
#

echo "======================"
echo "Connecting through VPN"
echo

if pgrep vpnc > /dev/null; then
    sudo vpnc-disconnect
fi

echo

if [ "$#" -ne 1 ]; then
    sudo vpnc-connect
else
    sudo vpnc-connect $1
fi

echo "======================"

