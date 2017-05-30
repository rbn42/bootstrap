mkdir ~/arch-build
rm ~/arch-build/compiz-core -rf
cd ~/arch-build

cd ~/arch-build
#需要是git版本的,不然做不了git操作
git clone https://aur.archlinux.org/compiz-core.git
cd ~/arch-build/compiz-core

#添加这部分到PKGBUILD尾部
#因为知道这个版本是0.8.12.3所以才这么写,下个版本需要改动.
echo """
prepare() {
  cd \"\${srcdir}/\${_upstream}-\${pkgver}\"
  git clone https://github.com/compiz-reloaded/compiz.git;
  cd compiz;git checkout v0.8.14;
  mv .git ../;cd ..;
  git remote add repo https://github.com/rbn42/compiz.git;
  git pull repo mystable --no-edit;
  #git merge repo/increase-blur-radius --no-edit;
}
""" >> PKGBUILD

#makepkg -ef
makepkg -i

yaourt -S ccsm --noconfirm
yaourt -S compiz-fusion-plugins-main --noconfirm
#这里有wallpaper
yaourt -S compiz-fusion-plugins-extra --noconfirm
#可以不用装
#cd ~/arch-build/compiz-fusion-plugins-experimental;makepkg -i 
yaourt -S emerald --noconfirm

#2016-10-13 03:48:36 Thu NZDT
#因为grid插件0.9版本新增的snap功能暂且还没有没进入release,
#所以需要安装github的版本,至于aur的git版本以为有依赖关系问题,所以我们只能绕开
#
#将来该功能添加后就不需要了
#https://github.com/compiz-reloaded/compiz-plugins-extra/issues/1
#2017-05-30 08:47:32 Tue JST  0.8.14已更新grid snap
###git clone https://github.com/compiz-reloaded/compiz-plugins-extra.git
###cd compiz-plugins-extra/
###NOCONFIGURE=1 ./autogen.sh
###./configure --prefix=/usr
###make

"""
2017-05-30 10:17:18 Tue JST
icu58 到icu59更新似乎改了一堆api牵扯了一堆软件
libcompizconfig0.8.14 在icu59下编译失败,需要滚回icu58
libcompizconfig似乎只是被ccsm依赖,但是没有ccsm似乎compiz不正常工作
"""
