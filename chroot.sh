cp /etc/resolv.conf /mnt/sabayon/etc/
cp *.sh   /mnt/installer/root
#cp ./make.conf /mnt/gentoo/etc/

cd /mnt/sabayon
#
mount -o bind /dev ./dev
mount -t devpts none ./dev/pts
mount -t tmpfs none ./dev/shm
mount -t proc none ./proc
mount -t sysfs none ./sys

#cd /mnt/gentoo
#mount -t proc none proc
#mount --rbind /sys sys
#mount --rbind /dev dev

chroot /mnt/sabayon

