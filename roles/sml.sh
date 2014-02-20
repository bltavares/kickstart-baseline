kickstart.info "Setting up sml"

source recipes/gcc.sh
kickstart.package.install gcc-multilib g++-multilib

mkdir -p /opt/sml
(
  cd /opt/sml
  [ -d config ] || kickstart.download.stream http://www.smlnj.org/dist/working/110.74/config.tgz | tar xz
  [ `which sml` ] || kickstart.mute config/install.sh
)
kickstart.path.add_to_profile.d sml.sh
