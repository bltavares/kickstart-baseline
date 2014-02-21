source roles/erlang.sh
kickstart.context elixir

baseline.elixir.install.Ubuntu() {
  local elixir_tarball='v0.11.2.zip'
  kickstart.package.install unzip

  (
  cd /opt
  [ -f $elixir_tarball ] || kickstart.download.file "https://github.com/elixir-lang/elixir/releases/download/v0.11.2/${elixir_tarball}" $elixir_tarball
  kickstart.mute "unzip -o $elixir_tarball -d elixir"
  )
  kickstart.profile.add_to_profile elixir.sh
}

baseline.elixir.install.Mac() {
  kickstart.package.install elixir
}

baseline.elixir.install.`kickstart.os`
