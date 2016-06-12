#ubuntu下安装没有问题,arch下尝试安装会导致宿主机崩溃
sudo su
bash ./download_bootstrap.sh "https://mirrors.kernel.org/archlinux/iso/2016.06.01/archlinux-bootstrap-2016.06.01-x86_64.tar.gz"
#chroot 结束后,尝试删除/tmp中的残余文件,结果导致运行系统崩溃,不过还好似乎没有触及硬盘系统的文件.
bash ./chroot_bootstrap.sh

cd
#导致宿主arch崩溃的步骤 
bash ./chroot_installer.sh /dev/sda6
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

