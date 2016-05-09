######################
#以下部分为n卡专用
cd
#下载n卡驱动,留到重启后安装
apt install wget -y
wget $1
#禁掉开源驱动
echo blacklist amd76x_edac   >> /etc/modprobe.d/blacklist.conf
echo blacklist vga16fb   >> /etc/modprobe.d/blacklist.conf
echo blacklist nouveau   >> /etc/modprobe.d/blacklist.conf
echo blacklist rivafb    >> /etc/modprobe.d/blacklist.conf
echo blacklist nvidiafb   >> /etc/modprobe.d/blacklist.conf
echo blacklist rivatv     >> /etc/modprobe.d/blacklist.conf
update-initramfs -u

ldconfig /usr/local/cuda-7.5/lib64 
