kickstart.context "gcc"

if [ `kickstart.os` == "Ubuntu" ]; then
  kickstart.package.install gcc build-essential
fi
