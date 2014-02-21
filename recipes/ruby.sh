source recipes/checkinstall.sh
source recipes/gcc.sh
kickstart.context ruby-install

baseline.ruby-install.install.Ubuntu() {
  (
  cd /opt
  [ -d ruby-install-0.4.0 ] || kickstart.download.stream https://github.com/postmodern/ruby-install/archive/v0.4.0.tar.gz | tar xz
  cd ruby-install-0.4.0
  kickstart.mute 'checkinstall -D'
  )
}

baseline.ruby_install.install.Mac() {
  kickstart.package.install ruby-install
}

baseline.chruby.install.Ubuntu() {
  (
  cd /opt
  [ -d chruby-0.3.8 ] || kickstart.download.stream https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz | tar xz
  cd chruby-0.3.8
  kickstart.mute 'checkinstall -D'
  )
}

baseline.chruby.install.Mac() {
  kickstart.package.install chruby
}

baseline.chruby.configuration() {
  echo `kickstart.profile.profile.d.location`/`kickstart.os`_ruby.sh
}

baseline.ruby_install.install.`kickstart.os`
baseline.chruby.install.`kickstart.os`
kickstart.profile.add_to_profile `kickstart.os`_ruby.sh
