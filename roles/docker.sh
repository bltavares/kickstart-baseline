kickstart.context docker
! kickstart.os.is Ubuntu &&  kickstart.info "Docker recipe is Ubuntu only so far" && return

echo 'deb http://get.docker.io/ubuntu docker main' > /etc/apt/sources.list.d/docker.list
kickstart.apt.add_key_from_keychain 36A1D7869245C8950F966E92D8576A8BA88D21E9
kickstart.package.update
kickstart.package.install lxc-docker

kickstart.group.create docker
kickstart.user.add_group ${baseline_docker_user:-`whoami`} docker
