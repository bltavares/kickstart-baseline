kickstart.context mongo

baseline.mongo.install.Ubuntu() {
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list
  kickstart.apt.add_key_from_keychain 7F0CEB10
  kickstart.package.update

  kickstart.package.install mongodb-10gen
  kickstart.service.enable mongodb
  kickstart.service.restart mongodb
}

baseline.mongo.install.Mac() {
  kickstart.info "Mongo won't run as service by default on mac"
  kickstart.package.install mongo
}

baseline.mongo.install.`kickstart.os`
