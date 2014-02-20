kickstart.context "erlang"

baseline.erlang.install.Ubuntu() {
  echo 'deb http://binaries.erlang-solutions.com/debian precise contrib' > /etc/apt/sources.list.d/erlang.list
  kickstart.apt.add_key_from_url http://binaries.erlang-solutions.com/debian/erlang_solutions.asc
  kickstart.package.update
  kickstart.package.install esl-erlang
}

baseline.erlang.install.Mac() {
  kickstart.package.install erlang
}

baseline.erlang.install.`kickstart.os`
