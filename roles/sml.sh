source recipes/gcc.sh
kickstart.context sml

baseline.sml.install.Ubuntu() {
  kickstart.package.install gcc-multilib g++-multilib

  mkdir -p /opt/sml
  (
  cd /opt/sml
  [ -d config ] || kickstart.download.stream http://www.smlnj.org/dist/working/110.74/config.tgz | tar xz
  kickstart.command_exists sml || kickstart.mute config/install.sh
  )
  kickstart.profile.add_to_profile sml.sh
}

baseline.sml.install.Mac() {
  kickstart.package.install smlnj
}

baseline.sml.install.`kickstart.os`
