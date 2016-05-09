#以下全程root操作
mkdir /mnt/fedora
mkfs.ext4 $1
mount $1 /mnt/fedora
