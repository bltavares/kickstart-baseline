! kickstart.os.is "Ubuntu" && return
kickstart.context Ubuntu

export DEBIAN_FRONTEND=noninteractive

kickstart.apt.upgrade
kickstart.package.install software-properties-common python-software-properties

baseline.ubuntu.add_universe_package_source() {
  local code_name=$(kickstart.codename)
  [ -z "$code_name" ] && echo "Couldn't fetch Ubuntu's codename" && exit 1

  kickstart.info "Check for presence of universe or add it"
  grep -q "$code_name universe" /etc/apt/sources.list || ( echo deb http://archive.ubuntu.com/ubuntu $code_name universe >> /etc/apt/sources.list )

  kickstart.apt.update
  kickstart.apt.upgrade
}
baseline.ubuntu.add_universe_package_source
