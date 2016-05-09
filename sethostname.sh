#设定主机名
echo $1 >  /etc/hostname
echo 127.0.0.1  $1 >> /etc/hosts
