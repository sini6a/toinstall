#!/bin/bash
clear
os=$(uname -m)

echo "--> WGET Installed! <--"
echo "--> YAJL Installed! <--"
echo "--> YAOURT Installed! <--"
echo "--> Packages installed! <--"
echo "--> Everything symlinked! <--"
echo "--- Enabling system services ---"
sleep 3
# If os is armv7l then do not enable CPUPOWER because of freeze issues
if [ "$os" == 'armv7l' ]; then
echo "-> CPUPOWER Not Enabled." && sleep 1
else
sudo systemctl enable cpupower
echo "-> CPUPOWER Enabled." && sleep 1
fi
# Enable ACPI Daemon
sudo systemctl enable acpid
echo "-> ACPID Enabled." && sleep 1
# Enable and configure NetworkManager
sudo systemctl enable NetworkManager
sudo gpasswd -a $(whoami) users

