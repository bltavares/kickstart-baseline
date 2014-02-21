kickstart.context go

baseline.go.install.Ubuntu() {
  baseline.go.download() {
    kickstart.download.stream https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar xz
  }

  (
  cd /opt
  [ -d go ] || baseline.go.download
  )
  kickstart.profile.add_to_profile go.sh
}

baseline.go.install.Mac() {
  kickstart.package.install go
}

baseline.go.install.`kickstart.os`
