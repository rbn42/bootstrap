mkdir ~/arch-build
rm ~/arch-build/compiz-core-git -rf
cd ~/arch-build

cd ~/arch-build
#需要是git版本的,不然做不了git操作
git clone https://aur.archlinux.org/compiz-core-git.git
cd ~/arch-build/compiz-core-git

#添加这部分到PKGBUILD尾部
echo """
prepare() {
  cd \"\${srcdir}/\${_upstream}\";
  git remote add repo https://github.com/rbn42/compiz.git;
  git pull repo increase-blur-radius --no-edit;
  #git merge repo/increase-blur-radius --no-edit;
}
""" >> PKGBUILD

#makepkg -ef
makepkg -i

yaourt -S ccsm
yaourt -S compiz-fusion-plugins-main
#这里有wallpaper
yaourrt -S compiz-fusion-plugins-extra
#可以不用装
#cd ~/arch-build/compiz-fusion-plugins-experimental;makepkg -i 
yaourt -S emerald
