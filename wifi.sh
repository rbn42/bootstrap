#!/bin/bash
#arch用
#netctl似乎比connman简单

#生成profile
sudo wifi-menu -o
#package
~/bin/install netctl dialog ppp dhcpcd wpa_supplicant wpa_actiond

cd /etc/netctl/
export PROFILE=`ls *Mas*`
echo $PROFILE
sudo netctl start $PROFILE
sudo netctl enable $PROFILE
sudo netctl reenable $PROFILE

#这种办法下netctl会阻塞boot,估计要20多秒.
#但是我想我们必须要把netctl注册为服务,因为这样在wifi断线后就会自动重连了吧.

#sudo wifi-menu
#~/bin/fixdns.sh

#connman
#~/bin/install connman
#~/bin/install wpa_supplicant
#sudo systemctl stop connman
#sudo systemctl disable connman
#sudo systemctl enable connman
#sudo systemctl start connman
#connmanctl enable wifi 
#connmanctl scan wifi 
#connmanctl services
#connmanctl state
#connmanctl 
#agent on
#connect wifi_c4e984114a8c_4d617374657273_managed_psk
#quit
#connmanctl state
