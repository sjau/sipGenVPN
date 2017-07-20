#!/usr/bin/env bash

# Set info colors
_Info () {
    printf '\033[1;30mInfo:\033[0m %s\n' "${1}"
}
_Success () {
    printf '\033[1;32mSuccess:\033[0m %s\n' "${1}"
}
_Error () {
    printf '\033[1;31mError:\033[0m %s\n' "${1}"
    exit 1
}
_Important () {
    printf '\033[1;33mNotice:\033[0m %s\n' "${1}"
}

# Check if a client name was supplied
if [[ -z "${confName}" ]]; then
    _Error "No client name was supplied. Pleased try again using './autoXXX clientname'."
    exit 1
fi

# Check if we have a config.conf
if [[ ! -e "config.conf" ]]; then
    cp "default.template" "config.conf"
    _Important "There was no config.conf before. A default was created. Please edit it."
    exit 1
else
    source "./config.conf"
fi

# Set paths according to EasyRSA version
case "${easyRSAVersion}" in
    3)  caPath="${easyRSAPath}/pki"
        crtPath="${easyRSAPath}/pki/issued"
        dhPath="${easyRSAPath}/pki"
        keyPath="${easyRSAPath}/pki/private"
        taPath="config/"
        ;;
    *)  _Error "Your EasyRSA Version is not suppored."
esac

# Check if files exist
if [[ ! -e "${caPath}/ca.crt" ]];           then _Error "Couldn't find 'ca.crt' in '${caPath}/'. Please fix."; fi
if [[ ! -e "${crtPath}/${confName}.crt" ]]; then _Error "Couldn't find '${confName}.crt' in '${crtPath}/'. Please fix."; fi
if [[ ! -e "${dhPath}/dh.pem" ]];           then _Error "Couldn't find 'dh.pem' in '${dhPath}''. Please fix."; fi
if [[ ! -e "${keyPath}/${confName}.key" ]]; then _Error "Couldn't find '${confName}.key' in '${keyPath}/'. Please fix."; fi
if [[ ! -e "${taPath}/ta.key" ]];           then _Error "Couldn't find 'ta.key' in the 'config' folder. Please run './genTA-Key.sh' to create one."; fi

# Create config subfolder
mkdir -p "config" || _Error "Couldn't create the config folder. Please fix."

# Load cert contents into vars
ca=$(<"${caPath}/ca.crt")
cert=$(<"${crtPath}/${confName}.crt")
key=$(<"${keyPath}/${confName}.key")
ta=$(<"${taPath}/ta.key")
# dh only needs to be on server, hence special treatment
dh=$(<"${dhPath}/dh.pem")
dh="<dh>
${dh}
</dh>"

case "${type}" in
    server) template="${server}"
            ;;
    client) template="${client}"
            dh=""
            ;;
esac

# Add inline keys and certs to template
template="${template}
${common}

<ca>
${ca}
</ca>
<cert>
${cert}
</cert>
<key>
${key}
</key>
<tls-auth>
${ta}
</tls-auth>
${dh}
"

printf "%s" "${template}" > "config/.config.tmp"
