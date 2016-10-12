sudo pacman -S snapd

sudo systemctl enable snapd
sudo systemctl start snapd

sudo systemctl enable snapd.socket
sudo systemctl start snapd.socket

sudo systemctl enable snapd.refresh.timer
sudo systemctl start snapd.refresh.timer

sudo snap refresh
snap list
