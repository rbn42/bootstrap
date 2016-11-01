#conky lua 的安装
#因为lua版本问题, cmake没法给conky找到lua路径,所以需要如下的配置
cd /dev/shm
git clone https://aur.archlinux.org/conky-git.git
#修改build,加入这些配置

#    -D BUILD_LUA_CAIRO=ON \
#    -D APP_TOLUA=/usr/bin/toluapp \
#    -D TOLUA_INCLUDE_PATH=/usr/include \
#    -D TOLUA_LIBS=/usr/lib/libtoluapp.so \
cd conky-git
makepkg -i
