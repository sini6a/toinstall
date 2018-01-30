#!bin/bash

echo "Setting timezone & locales"
ln -sf /usr/share/zoneinfo/Europe/Skopje /etc/localtime
hwclock --systohc
sed -i '/en_US.UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
sleep 1
clear

echo "Setting hostname"
read -p "Enter hostname: " name
echo "$name" > /etc/hostname 
sleep 1
clear

echo "Installing netctl dependecies for wifi-menu"
pacman -S vim iw wpa_supplicant wpa_actiond dialog --noconfirm
sleep 1
clear

echo "Please enter root password"
passwd
sleep 1
clear
echo "Please enter username"
read -p "Enter username: " user
useradd -m -G wheel $user
sleep 1
echo "Enter password for $user "
passwd $user
sleep 1
clear

echo "Please manually edit sudoers file"
sleep 3
visudo
sleep 1
clear

echo "Installing Bootloader"
pacman -S grub --noconfirm
clear
echo "Installing Bootloader"
read -p "Please enter HDD (sda, sdb, sdc, ..., sdn): " hdd
grub-install /dev/$hdd
grub-mkconfig -o /boot/grub/grub.cfg
clear

echo "Scipt will now exit, reboot to newly installed Time Machine ;)"
sleep 3
exit
