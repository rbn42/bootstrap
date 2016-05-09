debootstrap $1 /mnt/installer http://archive.ubuntu.com/ubuntu
#chroot準備
mount --bind /dev /mnt/installer/dev
mount --bind /dev/pts /mnt/installer/dev/pts
mount -t proc /proc /mnt/installer/proc
mount -t sysfs /sys /mnt/installer/sys

cat sources.list | sed "s/vivid/$1/g" >  /mnt/installer/etc/apt/sources.list
