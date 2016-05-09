#以下全程root操作
umount $1
mkfs.ext4 $1
mkdir /mnt/installer
mount $1 /mnt/installer
