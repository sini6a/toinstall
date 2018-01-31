#!/bin/bash
clear
os=$(uname -m)

echo "--- Installing WGET ---"
sleep 3
sudo pacman -S wget --noconfirm --needed && echo "--> WGET Installed! <--" && sleep 3 && clear 

clear
echo "--- Installing YAJL ---"
sleep 3
sudo pacman -S yajl --noconfirm --needed && echo "--> YAJL Installed! <--" && sleep 3 && clear

clear
echo "--- Installing YAOURT ---"
sleep 3
# Downloading YAOURT from AUR
wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz -P ~/ || sleep infinity
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz -P ~/ || sleep infinity
# Extracting tar to home dir
tar zxf ~/yaourt.tar.gz -C ~/
tar zxf ~/package-query.tar.gz -C ~/
# Installing packages
cd ~/package-query && makepkg && sudo pacman -U ~/package-query/*.pkg.tar.xz --noconfirm --needed
cd ~/yaourt && makepkg && sudo pacman -U ~/yaourt/*.pkg.tar.xz --noconfirm --needed
# Cleaning up
rm -r ~/package-query*
rm -r ~/yaourt*
echo "--> YAOURT Installed! <--" && sleep 3 && clear

# Install packages from packages.txt
if [ "$os" == 'armv7l' ]; then
echo "--- Installing packages (armv7l) ---"
sleep 3
(yaourt -Sy ~/toinstall/packages.txt --needed && clear) || sleep infinity;
echo "--> Packages installed! <--" && sleep 3
else
echo "--- Installing packages ---"
sleep 3
(yaourt -Sy ~/toinstall/packages.txt --noconfirm --needed && clear) || sleep infinity;
echo "--> Packages installed! <--" && sleep 3
fi

clear
echo "--- Symlinking config files ---"
sleep 3
# Create needed directories
mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi
# Copy rofi config
cp ~/toinstall/configs/rofi_config ~/.config/rofi/config.rasi
# Symlink everything else
ln -sfv ~/toinstall/configs/i3_config ~/.config/i3/config
ln -sfv ~/toinstall/configs/bash_config ~/.bashrc
ln -sfv ~/toinstall/configs/conky_config ~/.conkyrc
ln -sfv ~/toinstall/configs/i3blocks_config ~/.i3blocks.conf
ln -sfv ~/toinstall/configs/compton_config ~/.compton.conf
ln -sfv ~/toinstall/configs/Xresources ~/.Xresources
ln -sfv ~/toinstall/configs/xinitrc ~/.xinitrc
echo "--> Everything symlinked! <--" && sleep 3

clear
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
# Enable SLIM
sudo systemctl enable slim
echo "-> SLIM Enabled." && sleep 1
echo ""
echo "--> Everthing is installed and enabled.             <--"
echo "--> You should now reboot system and see the magic. <--"
echo "--> Press CTRL+C to terminate this window.          <--" && sleep infinity


