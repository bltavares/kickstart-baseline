! kickstart.os.is Mac && return
kickstart.context Mac

[ `whoami` = root ] && kickstart.info "Refusing to run as root on Mac" && exit 1

baseline.mac.install.homebrew() {
  kickstart.info "Installing brew"
  export PATH=/usr/local/bin:$PATH
  kickstart.mute 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
}

kickstart.command_exists brew || baseline.mac.install.homebrew
kickstart.package.update
kickstart.package.upgrade
kickstart.info "brew command outputs will be suppressed. Check \"brew info <package_name>\" for caveats"
