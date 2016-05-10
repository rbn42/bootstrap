echo en_US.UTF-8 UTF-8   >> /etc/locale.gen 
echo zh_CN.UTF-8 UTF-8   >> /etc/locale.gen 
echo LANG=$1 > /etc/locale.conf
locale-gen
