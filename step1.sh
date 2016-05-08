#以下全程root操作
#export TARGET_DISK="/dev/sda6"
mkdir /mnt/installer
mkfs.ext4 $1
mount $1 /mnt/installer
#下载ubuntu 14.04 系统
debootstrap trusty /mnt/installer http://archive.ubuntu.com/ubuntu
#chroot到14.04系统
mount --bind /dev /mnt/installer/dev
mount --bind /dev/pts /mnt/installer/dev/pts
mount -t proc /proc /mnt/installer/proc
mount -t sysfs /sys /mnt/installer/sys


#默认的sources.list里面的源很少，我这里宿主系统就是ubuntu，所以直接复制进去，然后再修改源的版本
#否则的话上网找一份吧
cat sources.list > /mnt/installer/etc/apt/sources.list

cp *.sh   /mnt/installer/root
