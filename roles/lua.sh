source recipes/gcc.sh
source recipes/checkinstall.sh
kickstart.context "lua"

luarocks_basename='luarocks-2.0.12'
luarocks_tarball="${luarocks_basename}.tar.gz"
luarocks_url="http://luarocks.org/releases/${luarocks_tarball}"

install_lua() {
  kickstart.package.install lua5.2 liblua5.2-dev
}

install_luarocks() {
  (
    cd /opt
    [ -d $luarocks_basename ] || kickstart.download.stream $luarocks_url | tar xz
    cd $luarocks_basename && \
      kickstart.mute './configure --with-lua-include=/usr/include/lua5.2' && \
      kickstart.mute make && \
      kickstart.mute 'checkinstall -D'
  )
}

install_lua
[ `which luarocks` ] || install_luarocks
