kickstart.context "go"

baseline.go.install() {
  baseline.go.download() {
    kickstart.download.stream https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar xz
  }

  (
  cd /opt
  [ -d go ] || baseline.go.download
  )
  kickstart.add_to_profile.d go.sh
}
baseline.go.install
