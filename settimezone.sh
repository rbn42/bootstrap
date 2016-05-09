cp /usr/share/zoneinfo/$1 /etc/localtime
echo  $1 > /etc/timezone
dpkg-reconfigure -f non-interactive tzdata
