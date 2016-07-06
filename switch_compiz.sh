#yaourt -S compiz-core
mkdir ~/arch-build
cd ~/arch-build


cd ~/arch-build
git clone https://aur.archlinux.org/compiz.git
git clone https://aur.archlinux.org/compiz-core.git
git clone https://aur.archlinux.org/compiz-fusion-plugins-extra.git
git clone https://aur.archlinux.org/compiz-fusion-plugins-experimental.git
#git clone https://aur.archlinux.org/emerald-themes.git

#安装和merge git的办法,不过这个版本没弄好emerald依赖.
#cd ~/arch-build/compiz/;makepkg
#cd ~/arch-build/compiz-core;makepkg -i
#
#git clone https://aur.archlinux.org/compiz-core-git.git
#cd ~/arch-build/compiz-core-git;makepkg -i
#cd ~/arch-build/compiz-core-git/src/compiz
#git remote add rbn42 https://github.com/rbn42/compiz.git
#git pull rbn42 increase-blur-radius
#git merge rbn42/increase-blur-radius
#

#可以把15改到25/0.1大概是极限了,到30 compiz就会崩溃
#0.0不可用,效果怪异
#其实blur.c中应该可以修改blur算法的,大约2000行代码.太麻烦了,所以算了.
#现在的算法和compton不同,用的是一维的kernal
vim ~/arch-build/compiz-core/src/compiz-0.8.12.3/plugins/blur.c #2处改动
#第三处改动，有一个4096数值，把radius限制在了28，如果改到8192，可以提升radius到50（或者以上），看来不是平方比例，而是一般比例，那么提升到1024*16,应该可疑做到radius100了。
#我们一次性提到1024*64吧。
#进一步到 4096 / 28 * 500 也就是1024*256
vim ~/arch-build/compiz-core/src/compiz-0.8.12.3/metadata/blur.xml #1处改动
#第二处，调整strength精度到0.001
vim ~/arch-build/compiz-core/src/compiz-0.8.12.3/metadata/blur.xml.in #1处改动
#第二处，调整strength精度到0.001
cd ~/arch-build/compiz-core
makepkg -ef
makepkg -i

sudo pacman -R emerald0.9
sudo pacman -R compiz
yaourt -S ccsm
yaourt -S compiz-fusion-plugins-main
#这里有wallpaper
cd ~/arch-build/compiz-fusion-plugins-extra;makepkg -i
#可以不用装
#cd ~/arch-build/compiz-fusion-plugins-experimental;makepkg -i 
yaourt -S emerald

sudo pacman -R emerald compiz-fusion-plugins-extra compiz-fusion-plugins-experimental compiz-fusion-plugins-main ccsm compiz
cd ~/arch-build/compiz/;makepkg -i
yaourt -S emerald0.9

