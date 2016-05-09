#chroot準備
mount --bind /dev /mnt/installer/dev
mount --bind /dev/pts /mnt/installer/dev/pts
mount -t proc /proc /mnt/installer/proc
mount -t sysfs /sys /mnt/installer/sys

cp /etc/resolv.conf /mnt/installer/etc/
cp /etc/hosts       /mnt/installer/etc/
cp *.sh   /mnt/installer/root
chroot /mnt/installer /bin/bash
