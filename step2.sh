echo arch > /etc/hostname
echo 127.0.0.1     arch >> /etc/hostname
ln -s /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
mkinitcpio -p linux
echo en_US.UTF-8 UTF-8   >> /etc/locale.gen 
echo zh_CN.UTF-8 UTF-8   >> /etc/locale.gen 
locale-gen

pacman -S  grub
pacman -S dialog
grub-install  /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S sudo
pacman -S wpa_supplicant
