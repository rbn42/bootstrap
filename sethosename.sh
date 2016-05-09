#添加32位架构支持
sudo dpkg --add-architecture i386
#设定主机名
echo $1 >  /etc/hostname
echo 127.0.0.1  $1 >> /etc/hosts
