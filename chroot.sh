#!bin/bash

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Setting timezone & locales <--"
ln -sf /usr/share/zoneinfo/Europe/Skopje /etc/localtime
hwclock --systohc || sleep infinity
sed -i '/en_US.UTF-8/s/^#//' /etc/locale.gen
locale-gen || sleep infinity
echo "LANG=en_US.UTF-8" > /etc/locale.conf
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Setting hostname <--"
read -p "-> Enter hostname: " name || sleep infinity
echo "$name" > /etc/hostname  || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Hostname set successfully! <--"
echo "--> Installing netctl dependecies for wifi-menu <--"
pacman -S vim iw wpa_supplicant wpa_actiond dialog --noconfirm || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Hostname set successfully! <--"
echo "--> Dependecies installed! <--"
echo "-> Please enter root password:"
passwd || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Hostname set successfully! <--"
echo "--> Dependecies installed! <--"
echo "--> Root password set! <--"
echo "--> Please enter username <--"
read -p "-> Enter username: " user || sleep infinity
useradd -m -G wheel $user || sleep infinity
sleep 1
echo "-> Enter password for $user: "
passwd $user || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Hostname set successfully! <--"
echo "--> Dependecies installed! <--"
echo "--> Root password set! <--"
echo "--> User configured! <--"
echo "--> Please manually edit sudoers file <--"
sleep 3
visudo
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Hostname set successfully! <--"
echo "--> Dependecies installed! <--"
echo "--> Root password set! <--"
echo "--> User configured! <--"
echo "--> SUDOERS file saved! <--"
echo "--> Installing Bootloader <--"
pacman -S grub --noconfirm || sleep infinity
clear
echo "--> Installing Bootloader <--"
echo "--> This will only work on BIOS and MBR <--"
read -p "-> Please enter HDD (sda, sdb, sdc, ..., sdn): " hdd
grub-install /dev/$hdd || sleep infinity
grub-mkconfig -o /boot/grub/grub.cfg || sleep infinity
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully! <--"
echo "--> chrooted and chroot.sh executed! <--"
echo "--> Timezone & locales configured! <--"
echo "--> Hostname set successfully! <--"
echo "--> Dependecies installed! <--"
echo "--> Root password set! <--"
echo "--> User configured! <--"
echo "--> SUDOERS file saved! <--"
echo "--> Bootloader installed and configured! <--"
echo
echo "--> We are done, please press CTRL+C and reboot <--"
sleep infinity
exit
