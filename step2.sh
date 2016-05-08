
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
#安装内核
apt install linux-image-generic -y
#设定主机名
echo ubuntu14 >  /etc/hostname
echo 127.0.0.1  ubuntu14 >> /etc/hosts
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
