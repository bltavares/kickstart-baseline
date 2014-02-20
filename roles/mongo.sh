kickstart.info "Setting up mongo"

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list
kickstart.apt.add_key_from_keychain 7F0CEB10
kickstart.apt.update

kickstart.package.install mongodb-10gen
kickstart.service.enable mongodb
kickstart.service.restart mongodb
