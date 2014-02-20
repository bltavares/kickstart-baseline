kickstart.info "Setting up go"

download_go() {
  kickstart.download.stream https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar xz
}

(
  cd /opt
  [ -d go ] || download_go
)
kickstart.path.add_to_profile.d go.sh
