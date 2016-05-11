cp /etc/resolv.conf /mnt/gentoo/etc/
cp *.sh   /mnt/installer/root
#cp ./make.conf /mnt/gentoo/etc/

cd /mnt/gentoo
mount -t proc none proc
mount --rbind /sys sys
mount --rbind /dev dev

chroot /mnt/gentoo 

