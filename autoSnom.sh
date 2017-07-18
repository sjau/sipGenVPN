#!/usr/bin/env bash

confName="${1}"

# Source common.sh
source "./common.sh"

# Change to config dir
cd "config" || _Error "Couldn't go to the config dir."

# Rename temporary file to vpn.cnf
mv ".config.tmp" "vpn.cnf"

# Chmod config to 0700
chmod 0700 "vpn.cnf"

# Make tar from the vpn.cnf
tar -cpf "${confName}_Snom.tar" "vpn.cnf"

# Remove the vpn.cnf file
#rm "vpn.cnf"

# Success
_Success "The generated config file is available as 'config/${confName}_Snom.tar'"
