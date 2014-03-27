kickstart.context Smalltalk

baseline.smalltalk.install.Ubuntu() {
  kickstart.apt.ppa ppa:pharo/stable
  kickstart.package.install pharo-vm-core pharo-launcher
}

baseline.smalltalk.install.Mac() {
  baseline.mac.install.homebrew-cask
  kickstart.mute brew cask install pharo
}

baseline.smalltalk.install.`kickstart.os`
