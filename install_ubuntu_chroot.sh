#安装工具
sudo apt-get install debootstrap
#以下全程root操作
sudo su
#格式化一个分区,挂载到/mnt/installer
gparted
export TARGET_DISK="/dev/sda6"
mkdir /mnt/installer
mount $TARGET_DISK /mnt/installer
#下载ubuntu 16.04 系统
debootstrap xenial /mnt/installer
#chroot到16.04系统
mount --bind /dev /mnt/installer/dev
mount --bind /dev/pts /mnt/installer/dev/pts
mount -t proc proc /mnt/installer/proc
mount -t sysfs sys /mnt/installer/sys
chroot /mnt/installer /bin/bash

######################################
#以下操作在chroot系统中进行
#设置时区和语言，自行调整
cp /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
echo 'LANG="en_NZ.UTF-8"' > /etc/default/locale 
echo 'LANGUAGE="en_NZ:en"' >>  /etc/default/locale
echo 'zh_CN.UTF-8 UTF-8' >>  /etc/locale.gen
echo 'en_US.UTF-8 UTF-8' >>  /etc/locale.gen
echo 'en_NZ.UTF-8 UTF-8' >>  /etc/locale.gen
echo 'Pacific/Auckland' > /etc/timezone
locale-gen 
dpkg-reconfigure -f non-interactive tzdata
#添加32位架构支持
sudo dpkg --add-architecture i386
#升级软件包
apt-get update -y
apt-get upgrade -y
#安装grub，有跳提示的时候，可以什么都不选，略过
apt-get install grub-pc -y 
#安装内核
apt install linux-image-generic -y
#手动生成grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg   
#手动安装grub引导
grub-install /dev/sda
#以防万一，检查下grub.cfg生成正确。
vi /boot/grub/grub.cfg
#设定主机名
echo ubuntu16 >  /etc/hostname
echo 127.0.0.1  ubuntu16 >> /etc/hosts
######################
#以下部分为n卡专用
cd
#下载n卡驱动,留到重启后安装
apt install wget -y
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/361.42/NVIDIA-Linux-x86_64-361.42.run
#禁掉开源驱动
echo blacklist amd76x_edac   >> /etc/modprobe.d/blacklist.conf
echo blacklist vga16fb   >> /etc/modprobe.d/blacklist.conf
echo blacklist nouveau   >> /etc/modprobe.d/blacklist.conf
echo blacklist rivafb    >> /etc/modprobe.d/blacklist.conf
echo blacklist nvidiafb   >> /etc/modprobe.d/blacklist.conf
echo blacklist rivatv     >> /etc/modprobe.d/blacklist.conf
sudo update-initramfs -u
#安装n卡驱动编译内核需要的源码
sudo apt install linux-generic linux-source -y
sudo apt install linux-image-generic -y
sudo apt install aria2 -y
######################################
#默认的sources.list里面的源很少，我这里宿主系统就是ubuntu，所以直接复制进去，然后再修改源的版本
#否则的话上网找一份吧
cat  /etc/sources.list > /mnt/install/etc/apt/sources.list
vi /mnt/install/etc/apt/sources.list
#安装基本软件
apt update -y
apt upgrade -y
apt-get install  ubuntu-standard -y
#安装ubuntu unity桌面，这个超大，1.6G
apt-get install ubuntu-desktop -y
#我自己用的常用软件。
apt install trash-cli  -y
apt -y install vim-gnome git  okular indicator-multiload
apt -y install gparted cmake xbacklight wine comix vlc
apt -y install aria2 goldendict python-autopep8
apt-get install -y unattended-upgrades
apt-get install aegisub -y
apt install ncmpcpp mpd -y
#删除一些讨厌的东西
rm /usr/share/applications/webbrowser-app.desktop 
sudo apt remove apport 
#添加一个管理员账号
adduser username
gpasswd -a username sudo
#设定/etc/fstab，这个很重要，简单的做法是复制宿主系统的/etc/fstab到新系统
#这里不展开了，上网查吧
vi /etc/fstab

#重启系统，如果是n卡，并且做了我上面说的操作，那么大概进不了gui 按ctrl+alt+f1进入tty界面，用管理员账号登陆
#停止x
sudo service lightdm stop
#安装n卡驱动
sudo su
cd
bash NVI*
#安装基本全选yes
sudo ln -s /usr/lib/libGL.so.1  /usr/lib/libGL.so
sudo rm /usr/lib/x86_64-linux-gnu/libGL.so 
sudo ln -s /usr/lib/libGL.so /usr/lib/x86_64-linux-gnu/libGL.so 
