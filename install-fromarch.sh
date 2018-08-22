sudo su
DEV_ROOT=/dev/sda3
DEV_BOOT=/dev/sda2
ROOT=/mnt/root

pacman -S arch-install-scripts

umount $DEV_ROOT
mkfs.ext4 $DEV_ROOT

mkdir $ROOT
mount $DEV_ROOT $ROOT
pacstrap $ROOT base
mount $DEV_BOOT $ROOT/boot
genfstab -pU $ROOT > $ROOT/etc/fstab
cp *.sh $ROOT/root

mount --bind /dev $ROOT/dev
mount --bind /sys $ROOT/sys
mount --bind /proc $ROOT/proc
chroot $ROOT
#arch-chroot /mnt

bash ./install2.sh
