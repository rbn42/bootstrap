#升级软件包
apt-get update -y
apt-get upgrade -y
#安装内核
apt install linux-image-generic -y
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
