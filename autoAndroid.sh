#!/usr/bin/env bash

confName="${1}"

# Source common.sh
source "./common.sh"

# Change to config dir
cd "config" || _Error "Couldn't go to the config dir."

# Rename temporary file to Android
mv ".config.tmp" "${confName}_Android.ovpn"

# Success
_Success "The generated config file is available as 'config/${confName}_Android.ovpn'"
