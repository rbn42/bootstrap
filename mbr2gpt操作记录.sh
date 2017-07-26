2017-07-26 20:19:05 Wed NZST
在运行中的linux上,无数据损失从mbr转换到gpt的记录
这里也包括了gpt上 efi bootloader的设置
注意下面混杂了bios和efi的设置,不过最终测试和使用的是efi


###########################
#首先以防万一,在磁盘尾部resize留出一个空白区域,因为gpt似乎需要占用那里

#转换mbr到gpt,过程很快就结束
sudo sgdisk -g /dev/sda

#用gparted检查下,确实转换完成了
sudo gparted /dev/sda

#运行中内核重读新分区表
sudo partprobe /dev/sda

#############################################################
#wiki上说bootloader需要重新安装
#建一个10M 的分区,一个512M的efi分区在尾部,流出100M的空间在尾部
sudo gparted /dev/sda
# t 修改分区类型为ef02,修改efi分区类型为ef00,w保存退出
sudo gdisk /dev/sda
#重新进入gparted会看到类型为bios boot, efi分区是boot,esp
sudo gparted /dev/sda
#格式化efi分区为fat32
sudo mkfs.fat -F32 /dev/sda3
#把efi用作boot分区
sudo mount /dev/sda3 /boot

#重装一次grub
sudo rm /boot/grub -r
sudo rm /boot/EFI -r
#sudo grub-install --target=i386-pc /dev/sda
#bootloader id wiki上说,可以用boot或者grub,猜测boot是启动默认的,grub是选择的.windows使用的是boot
sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=boot
sudo grub-mkconfig -o /boot/grub/grub.cfg

#命令b, 备份分区表
#sudo gdisk /dev/sda

