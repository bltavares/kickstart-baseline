kickstart.context "rabbitmq"

kickstart.rabbitmq.install.Ubuntu() {
  echo 'deb http://www.rabbitmq.com/debian/ stable main' > /etc/apt/sources.list.d/rabbitmq.list
  kickstart.apt.add_key_from_url http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
  kickstart.package.update
  kickstart.package.install rabbitmq-server

  kickstart.service.enable rabbitmq-server
  kickstart.service.restart rabbitmq-server
}

kickstart.rabbitmq.install.Mac() {
  kickstart.package.install rabbitmq
}

kickstart.rabbitmq.install.`kickstart.os`
