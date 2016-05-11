######################################
#以下操作在chroot系统中进行
#设置语言，自行调整
#echo LANG=$1_$2.$3      >   /etc/default/locale 
#echo LANGUAGE=$1_$2:$1  >>  /etc/default/locale
#echo LC_ALL=$1_$2.$3    >>  /etc/default/locale
export LC_ALL=$1_$2.$3  
#locale-gen 
echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo en_NZ.UTF-8 UTF-8 >> /etc/locale.gen
echo zh_CN.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen 
