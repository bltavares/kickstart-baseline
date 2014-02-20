kickstart.info "Setting up redis"

if [ `kickstart.os` == "Ubuntu" ]; then
  kickstart.apt.ppa ppa:chris-lea/redis-server
  kickstart.package.install redis-server
  cp files/redis.conf /etc/redis/redis.conf
  kickstart.service.enable redis-server
  kickstart.service.restart redis-server
fi
