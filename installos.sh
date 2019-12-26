#!/bin/bash

echo "--> This script assumes that you have already prepared HDD for Arch Linux install, and mounted it on /mnt. <--"
echo "-->        If this isn't the case then please press Ctrl + C or install it by yourself. Thank you.         <--"
for i in {5..0}; do echo -ne "$i"'.. '; sleep 1; done; echo
clear

echo "--> Setting timedatectl to ntp <--"
(timedatectl set-ntp true && clear) || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> Copying chroot.sh to /mnt <--"
cp ./chroot.sh /mnt || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstrap-ing into /mnt - base & base-devel packages <--"
pacstrap /mnt base base-devel linux-firmware linux --needed || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> Generating fstab .<--"
genfstab -U /mnt >> /mnt/etc/fstab || sleep infinity
sleep 1
clear

echo "--> timedatectl configured <--"
echo "--> chroot.sh copied to /mnt <--"
echo "--> Pacstraped successfully! <--"
echo "--> fstab generated successfully <--"
echo "--> Chroot /mnt and exec chroot.sh <--"
arch-chroot /mnt ./chroot.sh || sleep infinity
sleep 1
clear


