
pacman-key --init
pacman-key --populate archlinux
#chroot内部没有编辑器
#step0
#sudo vim /tmp/root.x86_64/etc/pacman.d/mirrorlist
echo Server = http://mirror.rackspace.com/archlinux/\$repo/os/\$arch >>  /etc/pacman.d/mirrorlist
pacman -Syyu

mount /dev/sda7 /mnt
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab
cp ~/git/chroot_script  /mnt/root -r

