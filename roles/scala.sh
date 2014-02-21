source roles/java.sh
kickstart.context scala

baseline.scala.install.scala.Ubuntu() {
  scala_basename='scala-2.10.3'
  (
  cd /opt
  [ -d $scala_basename ] || kickstart.download.stream "http://www.scala-lang.org/files/archive/${scala_basename}.tgz" | tar xz
  kickstart.file.link $scala_basename scala
  )
  kickstart.profile.add_to_profile scala.sh
}

baseline.scala.install.scala.Mac() {
  kickstart.package.install scala
}

baseline.scala.install.sbt.Ubuntu() {
  (
  cd /opt
  [ -f sbt.deb ] || kickstart.download.file http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.0/sbt.deb sbt.deb
  kickstart.mute 'dpkg -i sbt.deb'
  )
}

baseline.scala.install.sbt.Mac() {
  kickstart.package.install sbt
}

baseline.scala.install.scala.`kickstart.os`
baseline.scala.install.sbt.`kickstart.os`
