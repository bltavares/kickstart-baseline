source recipes/checkinstall.sh
source recipes/gcc.sh
kickstart.info "Setting up ruby-install"

install_ruby_install() {
  (
  cd /opt
  [ -d ruby-install-0.4.0 ] || kickstart.download.stream https://github.com/postmodern/ruby-install/archive/v0.4.0.tar.gz | tar xz
  cd ruby-install-0.4.0
  kickstart.mute 'checkinstall -D'
  )
}

install_chruby() {
  (
  cd /opt
  [ -d chruby-0.3.8 ] || kickstart.download.stream https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz | tar xz
  cd chruby-0.3.8
  kickstart.mute 'checkinstall -D'
  )
}

install_ruby_install
install_chruby
kickstart.path.add_to_profile.d ruby.sh
