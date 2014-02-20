kickstart.context "rabbitmq"

echo 'deb http://www.rabbitmq.com/debian/ stable main' > /etc/apt/sources.list.d/rabbitmq.list
kickstart.apt.add_key_from_url http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
kickstart.apt.update
kickstart.package.install rabbitmq-server

kickstart.service.enable rabbitmq-server
kickstart.service.restart rabbitmq-server
