sudo systemctl enable cronie
yaourt -S gtk-theme-arc
yaourt -S ambiance-radiance-flat-colors-suite
yaourt -S awoken-icons
yaourt -S fcitx-sogoupinyin
yaourt -S volnoti
yaourt -S twmn-git

yaourt -S breeze-snow-cursor-theme

#好像mpd-notification使用者更多,不过下载gpg验证失败.
yaourt -S mpd-notification-git

#vim相关
yaourt -S js-beautify
#安装失败
#yaourt -S beautify-css



#用vundle安装ycm有点麻烦,总是要手动编译,而且可能会出错.
#安装失败
#yaourt -S vim-youcompleteme-git
#轻依赖版,(奇怪的会下载145m的llvm),安装失败.
#yaourt -S vim-youcompleteme-core-git

cd /
sudo ln -s /run/media 
#nvidia-xconfig
#xte
#别忘了装rofi

#compiz installation is complex
#compiz编译在这台电脑上很容易失败,所以只能开机后进入tty单开yaourt编译.
#yaourt -S compiz
#yaourt -S emerald0.9

#sudo pacman -S cuda 
#yaourt -S python-pycuda
#yaourt -S python-theano

#这个是1.9版本的,但是我们需要的是1.10版本.panda3d网上只提供了deb包,所以我们要自己编译了.
#安装下面的包或许可以帮忙把依赖装上
#yaourt -S panda3d

###yaourt -S emerald-themes
