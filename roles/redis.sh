kickstart.context redis

baseline.redis.install.Ubuntu() {
  kickstart.apt.ppa ppa:chris-lea/redis-server
  kickstart.package.install redis-server
  cp files/redis.conf /etc/redis/redis.conf
  kickstart.service.enable redis-server
  kickstart.service.restart redis-server
}

baseline.redis.install.Mac() {
  kickstart.package.install redis
}

baseline.redis.install.`kickstart.os`
