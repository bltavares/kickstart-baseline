kickstart.info "Setting up erlang"

echo 'deb http://binaries.erlang-solutions.com/debian precise contrib' > /etc/apt/sources.list.d/erlang.list
kickstart.apt.add_key_from_url http://binaries.erlang-solutions.com/debian/erlang_solutions.asc
kickstart.apt.update
kickstart.package.install esl-erlang
