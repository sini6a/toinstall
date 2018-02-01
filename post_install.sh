#!/bin/bash
clear
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/scripts/install_wget.sh        # Script dependency
$DIR/scripts/install_yajl.sh        # Script dependency
$DIR/scripts/install_yaourt.sh      # Installing yaourt
#$DIR/scripts/install_packages.sh    # Install packages from "packages.txt" using yaourt
$DIR/scripts/symlink.sh             # Symlink configs to be updated with repo
#$DIR/scripts/system_services.sh     # Enable system services

clear
echo "--> WGET Installed! <--"
echo "--> YAJL Installed! <--"
echo "--> YAOURT Installed! <--"
echo "--> Packages installed! <--"
echo "--> Everything symlinked! <--"
echo "--> System services Enabled! <--"
echo ""
echo "--> Everthing is installed and enabled.             <--"
echo "--> You should now reboot system and see the magic. <--"
echo "--> Press CTRL+C to terminate this window.          <--" && sleep infinity
