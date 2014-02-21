kickstart.context io

baseline.io.install.Ubuntu() {
  local io_dest=iobin-linux-x64-deb-current.zip

  (
  cd /opt
  [ -f $io_dest ] || kickstart.download.file http://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip $io_dest
  kickstart.package.install unzip
  kickstart.mute "unzip $io_dest -d io_lang_current"
  dpkg -i io_lang_current/*.deb
  )
}

baseline.io.install.Mac() {
  kickstart.package.install io
}

baseline.io.install.`kickstart.os`
