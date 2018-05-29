#ubuntu下安装没有问题,arch下尝试安装会导致宿主机崩溃
sudo su
bash ./download_bootstrap.sh "https://mirrors.kernel.org/archlinux/iso/2016.06.01/archlinux-bootstrap-2016.06.01-x86_64.tar.gz"
#chroot 结束后,尝试删除/tmp中的残余文件,结果导致运行系统崩溃,不过还好似乎没有触及硬盘系统的文件.

cp *.sh /tmp/root.x86_64/root
mount --bind /tmp/root.x86_64 /tmp/root.x86_64
cd /tmp/root.x86_64
cp /etc/resolv.conf etc/
mount -t proc /proc proc
mount --rbind /sys sys
mount --rbind /dev dev
mount --rbind /run run    # (assuming /run exists on the system)
export LC_ALL=en_US.UTF-8
chroot /tmp/root.x86_64 /bin/bash

cd
#导致宿主arch崩溃的步骤 
ROOT=/dev/sda6
pacman-key --init
pacman-key --populate archlinux
echo Server = http://mirror.rackspace.com/archlinux/\$repo/os/\$arch >>  /etc/pacman.d/mirrorlist
pacman -Syyu

umount $ROOT
mkfs.ext4 $ROOT
mount $ROOT /mnt
pacstrap /mnt base
genfstab -p /mnt > /mnt/etc/fstab
cp *.sh /mnt/root


arch-chroot /mnt

bash ./install2.sh
