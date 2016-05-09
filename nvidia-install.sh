#停止x
service lightdm stop
#安装n卡驱动
#安装基本全选yes
bash NVI*
sudo ln -s /usr/lib/libGL.so.1  /usr/lib/libGL.so
sudo rm /usr/lib/x86_64-linux-gnu/libGL.so 
sudo ln -s /usr/lib/libGL.so /usr/lib/x86_64-linux-gnu/libGL.so 
