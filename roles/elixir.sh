source roles/erlang.sh
kickstart.info "Setting up elixir"

elixir_tarball='v0.11.2.zip'
kickstart.package.install unzip

(
  cd /opt
  [ -f $elixir_tarball ] || kickstart.download.file "https://github.com/elixir-lang/elixir/releases/download/v0.11.2/${elixir_tarball}" $elixir_tarball
  kickstart.mute "unzip -o $elixir_tarball -d elixir"
)
kickstart.path.add_to_profile.d elixir.sh