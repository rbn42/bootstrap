#!/bin/bash 
pacman -Syyu
mount /dev/sda7 /mnt
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt
