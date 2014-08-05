kickstart.context java

baseline.java.install.java.Ubuntu() {
  kickstart.apt.ppa ppa:webupd8team/java
  echo debconf shared/accepted-oracle-license-v1-1 select true | kickstart.mute debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | kickstart.mute debconf-set-selections
  kickstart.package.install oracle-java7-installer
}

baseline.java.install.maven.Ubuntu() {
  local maven_basename='apache-maven-3.2.1'
  local maven_url="http://archive.apache.org/dist/maven/binaries/${maven_basename}-bin.tar.gz"

  (
  cd /opt
  [ -d $maven_basename ] || kickstart.download.stream $maven_url | /bin/tar xz
  kickstart.file.link $maven_basename maven
  )
  kickstart.profile.add_to_profile maven.sh
}

baseline.java.install.maven.Mac() {
  kickstart.package.install maven
}

baseline.java.install.ant.Ubuntu() {
  local ant_basename='apache-ant-1.9.4'
  local ant_url="http://archive.apache.org/dist/ant/binaries/${ant_basename}-bin.tar.gz"
  (
  cd /opt
  [ -d $ant_basename ] || kickstart.download.stream $ant_url | /bin/tar xz
  kickstart.file.link $ant_basename ant
  )
  kickstart.profile.add_to_profile ant.sh
}

baseline.java.install.ant.Mac() {
  kickstart.package.install ant
}

kickstart.os.is Ubuntu && baseline.java.install.java.Ubuntu
baseline.java.install.maven.`kickstart.os`
baseline.java.install.ant.`kickstart.os`
