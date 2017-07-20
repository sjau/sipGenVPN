# sipGenVPN

Small collection of bash scripts to create server and client config files for OpenVPN, also some client configs for SIP hard- and softphones.

The configurations contain TLS-Auth and inline certificates/keys.

NOTE: There's a default config that will work if everything is setup correctly (ipforward, open ports in the firewall, correct server address etc.).
      Feel free to adjust the default config template to your needs.

## Usage

### Prerequisite: EasyRSA

EasyRSA is being used for creating the certs and keys and dh. Download the latest version from:

https://github.com/OpenVPN/easy-rsa/releases

In order to setup the CA system you can use this howto:

https://community.openvpn.net/openvpn/wiki/EasyRSA3-Insecure-PKI

NOTE: In step 7 you can add the "nopass" parameter, so that the certificates don't have a password.


### Generating the configs

1. Clone the repository
1. Run the genTA-Key.sh script for creating a key for TLS-Auth.
1. Run one of the scripts for the first time; you need to provide the name of a client cert, e.g. './autoLinux.sh myNotebook'
1. It will create a config.conf file. Edit this file and set according variables and adjust the template to your needs
1. Re-run the script
1. If paths were set correctly, it will create the desired configuration in the 'config' folder


## Requirements

1. EasyRSA installation
1. Setting correct paths in the config.conf
1. The autoWindows.sh requires the unix2dos program to make linebreak pretty also when edited in Widnows


### The packages scripts

## autoServer

This will create a "server.conf" in the 'config' dir.

## autoLinux

This will just create a "clientcert.conf" in the 'config' dir.

## autoAndroid

This will just create a "clientcert_Android.ovpn" in the 'config' dir. This can be used on Android in OpenVPN clients.

## autoWindows

Basically the same as the autoLinux, except it has Windows line breaks and is named "clientcert_Windows.ovpn"

## autoSnom

This creates a "clientcert_Snom.tar" file that can be used on Snom SIP phones. Tested on Snom 370.

You need custom firmware for Snom to provide OpenVPN. See http://wiki.snom.com/Networking/Virtual_Private_Network_(VPN)

## autoYealink

This creates a "clientcert_Yealink.tar" file that can be used on Yealink SIP phones. Tested on Yealink T48G.

## genTA-keys

This creates a ta.key for TLS-Auth in the 'config' dir.
