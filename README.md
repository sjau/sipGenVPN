# sipGenVPN

Small collection of bash scripts to create client config files for SIP hard- and softphones.

The configurations contain TLS-Auth and inline certificates/keys.

## Usage

1. Clone the repository
1. Run one of the scripts for the first time; you need to provide the name of a client cert, e.g. './autoLinux.sh myNotebook'
1. It will create a config.conf file. Edit this file and set according variables and adjust the template to your needs
1. Re-run the script
1. If paths were set correctly, it will create the desired configuration in the 'config' folder

## Requirements

1. EasyRSA installation
1. Setting correct paths in the config.conf
1. The autoWindows.sh requires the unix2dos program to make linebreak pretty also when edited in Widnows

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
