
######################################
#以下操作在chroot系统中进行
#设置时区和语言，自行调整
cp /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
echo 'LANG="en_NZ.UTF-8"' > /etc/default/locale 
echo 'LANGUAGE="en_NZ:en"' >>  /etc/default/locale
echo 'LC_ALL=en_NZ.UTF-8' >>  /etc/default/locale
locale-gen zh_CN.UTF-8
locale-gen en_US.UTF-8
locale-gen en_NZ.UTF-8
#echo 'zh_CN.UTF-8 UTF-8' >>  /etc/locale.gen
#echo 'en_US.UTF-8 UTF-8' >>  /etc/locale.gen
#echo 'en_NZ.UTF-8 UTF-8' >>  /etc/locale.gen
echo 'Pacific/Auckland' > /etc/timezone
#locale-gen 
dpkg-reconfigure -f non-interactive tzdata
#添加32位架构支持
sudo dpkg --add-architecture i386
#设定主机名
echo ubuntu14 >  /etc/hostname
echo 127.0.0.1  ubuntu14 >> /etc/hosts
