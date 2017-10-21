#!/bin/bash

echo "This script assumes that you have already prepared HDD for Arch Linux install, and mounted it on /mnt."
echo "If this isn't the case then please press Ctrl + C or install it by yourself. Thank you."
for i in {15..0}; do echo -ne "$i"'.. '; sleep 1; done; echo
clear

echo "Setting TimeDateCTL"
timedatectl set-ntp true
sleep 3
clear

echo "Copying chroot.sh to /mnt"
cp ./chroot.sh /mnt
sleep 3
clear

echo "Pacstrap-ing into /mnt - base & base-devel packages"
pacstrap /mnt base base-devel --needed
sleep 3
clear

echo "Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab
sleep 3
clear

echo "Chroot /mnt and exec chroot.sh"
arch-chroot /mnt ./chroot.sh
sleep 3
clear


