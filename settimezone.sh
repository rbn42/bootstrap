cp /usr/share/zoneinfo/$1 /etc/localtime
echo  $1 > /etc/timezone
export DEBIAN_FRONTEND="noninteractive"
dpkg-reconfigure -f non-interactive tzdata
