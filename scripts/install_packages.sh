#!/bin/bash
clear
os=$(uname -m)

echo "--> WGET Installed! <--"
echo "--> YAJL Installed! <--"
echo "--> YAOURT Installed! <--"
# Install packages from packages.txt
if [ "$os" == 'armv7l' ]; then
echo "--- Installing packages (armv7l) ---"
sleep 3
(yaourt -Sy ~/toinstall/packages.txt --needed && clear) || sleep infinity;
(yaourt -Sy ~/toinstall/packages_aur.txt --needed && clear) || sleep infinity;
echo "--> Packages installed! <--" && sleep 3
else
echo "--- Installing packages ---"
sleep 3
(yaourt -Sy ~/toinstall/packages.txt --noconfirm --needed && clear) || sleep infinity;
(yaourt -Sy ~/toinstall/packages_aur.txt --noconfirm --needed && clear) || sleep infinity;
echo "--> Packages installed! <--" && sleep 3
fi
