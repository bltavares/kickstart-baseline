kickstart.context "rust"

baseline.rust.install.Ubuntu() {
  rust_dest=rust_0.8-1_amd64.deb
  rust_md5='7f2e19bc5cde47e143b7484ecda0207f'

  check_rust_integrity() {
    [ -f $rust_dest ] && ( md5sum $rust_dest | grep -q $rust_md5 )
  }

  (
  cd /opt
  check_rust_integrity || kickstart.download.file https://copy.com/voMAE7mI19Jf $rust_dest
  dpkg -i $rust_dest
  )
}

baseline.rust.install.Mac() {
  kickstart.package.install rust
}

baseline.rust.install.`kickstart.os`
