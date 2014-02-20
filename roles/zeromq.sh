kickstart.info "Setting up zeromq"

kickstart.package.install autoconf automake uuid-dev libtool

zeromq_basename='zeromq-4.0.3'
(
  cd /opt
  [ -d $zeromq_basename ] || kickstart.download.stream http://download.zeromq.org/${zeromq_basename}.tar.gz | tar xz
  [ ! -f /usr/local/lib/libzmq.so ] && \
    cd $zeromq_basename && \
    kickstart.mute ./configure && \
    kickstart.mute make && \
    kickstart.mute 'checkinstall -D'
  ldconfig
)
