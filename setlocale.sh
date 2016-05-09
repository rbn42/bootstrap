######################################
#以下操作在chroot系统中进行
#设置语言，自行调整
echo LANG=$1_$2.$3      >   /etc/default/locale 
echo LANGUAGE=$1_$2:$1  >>  /etc/default/locale
echo LC_ALL=$1_$2.$3    >>  /etc/default/locale
#locale-gen 
locale-gen en_US.UTF-8
locale-gen zh_CN.UTF-8
locale-gen $1_$2.$3
