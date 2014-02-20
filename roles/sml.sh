source recipes/gcc.sh
kickstart.context "sml"

kickstart.package.install gcc-multilib g++-multilib

mkdir -p /opt/sml
(
  cd /opt/sml
  [ -d config ] || kickstart.download.stream http://www.smlnj.org/dist/working/110.74/config.tgz | tar xz
  kickstart.command_exists sml || kickstart.mute config/install.sh
)
kickstart.add_to_profile.d sml.sh
