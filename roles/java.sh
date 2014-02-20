kickstart.context "java"

install_java() {
  kickstart.apt.ppa ppa:webupd8team/java
  echo debconf shared/accepted-oracle-license-v1-1 select true | kickstart.mute debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | kickstart.mute debconf-set-selections
  kickstart.package.install oracle-java7-installer
}

install_maven() {
  maven_basename='apache-maven-3.1.1'
  maven_url="http://www.apache.org/dist/maven/maven-3/3.1.1/binaries/${maven_basename}-bin.tar.gz"

  (
  cd /opt
  [ -d $maven_basename ] || kickstart.download.stream $maven_url | /bin/tar xz
  rm -rf maven 2> /dev/null
  ln -s $maven_basename maven
  )
  kickstart.path.add_to_profile.d maven.sh
}


install_ant() {
  ant_basename='apache-ant-1.9.3'
  ant_url="http://www.apache.org/dist/ant/binaries/${ant_basename}-bin.tar.gz"
  (
  cd /opt
  [ -d $ant_basename ] || kickstart.download.stream $ant_url | /bin/tar xz
  rm -rf ant 2> /dev/null
  ln -s $ant_basename ant
  )
  kickstart.path.add_to_profile.d ant.sh
}

install_java
install_maven
install_ant
