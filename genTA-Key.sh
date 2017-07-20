#!/usr/bin/env bash

mkdir -p "config" || { printf '\033[1;31mError:\033[0m %s\n' "Couldn't create the 'config' folder. Aborting."; exit; }

openvpn --genkey --secret "config/ta.key" || { printf '\033[1;31mError:\033[0m %s\n' "Couldn't create the 'ta.key' in the 'config' folder. Aborting."; exit; }
