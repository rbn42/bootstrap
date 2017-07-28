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
genfstab -p $ROOT > $ROOT/etc/fstab
cp *.sh $ROOT/root

mount --bind /dev $ROOT/dev
mount --bind /sys $ROOT/sys
mount --bind /proc $ROOT/proc
chroot $ROOT
#arch-chroot /mnt

cd
bash ./setlocale.sh en_US.UTF-8
bash ./sethostname.sh arch
bash ./settimezone.sh Pacific/Auckland
mkinitcpio -p linux
echo nameserver 8.8.8.8 > /etc/resolv.conf

#wifi sudo grub
pacman -S sudo wpa_supplicant dialog grub netctl ppp dhcpcd wpa_actiond

visudo #uncomment /wheel
bash adduser.sh #username

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
#到此为止重启,继续安装容易产生错误.
#update grub in ubuntu, reboot
#passwd root # set random passwd, disable root

