cp /etc/resolv.conf /mnt/funtoo/etc/
cp *.sh   /mnt/installer/root
cp ./make.conf /mnt/funtoo/etc/

cd /mnt/funtoo
mount -t proc none proc
mount --rbind /sys sys
mount --rbind /dev dev

chroot /mnt/funtoo 

