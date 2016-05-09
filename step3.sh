#升级软件包
apt-get update -y
apt-get upgrade -y
#安装内核
apt install linux-image-generic -y
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
