pacman-key --init
pacman-key --populate archlinux

echo Server = http://mirror.rackspace.com/archlinux/\$repo/os/\$arch >>  /etc/pacman.d/mirrorlist
pacman -Syyu

mount $1 /mnt
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab
cp *.sh /mnt/root
arch-chroot /mnt
