sudo su
bash ./download_bootstrap.sh "https://mirrors.kernel.org/archlinux/iso/2016.05.01/archlinux-bootstrap-2016.05.01-x86_64.tar.gz"
bash ./chroot_bootstrap.sh

cd
bash ./chroot_installer.sh /dev/sda8
arch-chroot /mnt

cd
bash ./setlocale.sh en_US.UTF-8
bash ./sethostname.sh arch
bash ./settimezone.sh Pacific/Auckland
mkinitcpio -p linux

pacman -S sudo wpa_supplicant dialog

visudo #uncomment /wheel
bash adduser.sh username

#update grub in ubuntu, reboot
passwd root # set random passwd, disable root

