#!/usr/bin/env bash

# Check if unix2dos is available
type -P "unix2dos" &>/dev/null || { printf '\033[1;31mError:\033[0m %s\n' "Couldn't find the 'unix2dos' program. Please install."; exit 1; }

confName="${1}"

# Source common.sh
source "./common.sh"

# Change to config dir
cd "config" || _Error "Couldn't go to the config dir."

# Create config file with Windows line breaks
unix2dos -n ".config.tmp" "${confName}_Windows.ovpn" &>/dev/null 

# Remove temporary file
rm ".config.tmp"

# Success
_Success "The generated config file is available as 'config/${confName}_Windows.ovpn'"
