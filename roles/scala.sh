kickstart.info "Setting up scala"

source roles/java.sh

install_scala() {
  scala_basename='scala-2.10.3'
  (
  cd /opt
  [ -d $scala_basename ] || kickstart.download.stream "http://www.scala-lang.org/files/archive/${scala_basename}.tgz" | tar xz
  rm -rf scala 2> /dev/null
  ln -s $scala_basename scala
  )
  kickstart.path.add_to_profile.d scala.sh
}

install_sbt() {
  (
  cd /opt
  [ -f sbt.deb ] || kickstart.download.file http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.0/sbt.deb sbt.deb
  kickstart.mute 'dpkg -i sbt.deb'
  )
}

install_scala
install_sbt
