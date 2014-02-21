source roles/java.sh
kickstart.context groovy

baseline.groovy.install.Ubuntu() {
  local groovy_basename='groovy-2.2.1'
  local groovy_tarball="${groovy_basename}.zip"

  kickstart.package.install unzip

  (
  cd /opt
  [ -f $groovy_tarball ] || kickstart.download.file http://dist.groovy.codehaus.org/distributions/groovy-binary-2.2.1.zip $groovy_tarball
  kickstart.mute "unzip -o $groovy_tarball"
  rm -rf groovy 2> /dev/null
  ln -s $groovy_basename groovy
  )
  kickstart.profile.add_to_profile groovy.sh
}

baseline.groovy.install.Mac() {
  kickstart.package.install groovy
}

baseline.groovy.install.`kickstart.os`
