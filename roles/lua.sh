source recipes/gcc.sh
source recipes/checkinstall.sh
kickstart.context lua

baseline.lua.packages() {
  kickstart.os.is Ubuntu && echo lua5.2 liblua5.2-dev
  kickstart.os.is Mac && echo lua52 luarocks --with-lua52
}

baseline.lua.install.lua() {
  kickstart.package.install `baseline.lua.packages`
}

baseline.lua.install.luarocks.ubuntu() {
  local luarocks_basename='luarocks-2.0.12'
  local luarocks_tarball="${luarocks_basename}.tar.gz"
  local luarocks_url="http://luarocks.org/releases/${luarocks_tarball}"
  (
  cd /opt
  [ -d $luarocks_basename ] || kickstart.download.stream $luarocks_url | tar xz
  cd $luarocks_basename && \
    kickstart.mute './configure --with-lua-include=/usr/include/lua5.2' && \
    kickstart.mute make && \
    kickstart.mute 'checkinstall -D'
  )
}

baseline.lua.install.lua
! kickstart.command_exists luarocks && kickstart.os.is Ubuntu && baseline.lua.install.luarocks
