sudo su
pacman -S arch-install-scripts
export ROOT=/dev/sda6
umount $ROOT
mkfs.ext4 $ROOT
mount $ROOT /mnt
pacstrap /mnt base
genfstab -p /mnt > /mnt/etc/fstab
cp *.sh /mnt/root

mount --bind /dev /mnt/dev
mount --bind /sys /mnt/sys
mount --bind /proc /mnt/proc
chroot /mnt
#arch-chroot /mnt

cd
bash ./setlocale.sh en_US.UTF-8
bash ./sethostname.sh arch
bash ./settimezone.sh Pacific/Auckland
mkinitcpio -p linux
echo nameserver 8.8.8.8 > /etc/resolv.conf

visudo #uncomment /wheel
bash adduser.sh #username

pacman -S sudo wpa_supplicant dialog grub

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
#到此为止重启,继续安装容易产生错误.
#update grub in ubuntu, reboot
#passwd root # set random passwd, disable root

