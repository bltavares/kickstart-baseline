kickstart.context "mongo"

baseline.mongo.install.ubuntu() {
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list
  kickstart.apt.add_key_from_keychain 7F0CEB10
  kickstart.package.update

  kickstart.package.install mongodb-10gen
  kickstart.service.enable mongodb
  kickstart.service.restart mongodb
}

baseline.mongo.install.mac() {
  kickstart.info "Mongo won't run as service by default on mac"
  kickstart.package.install mongo
}

kickstart.os.is "Ubuntu" && baseline.mongo.install.ubuntu
kickstart.os.is "Mac" && baseline.mongo.install.mac
