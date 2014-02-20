kickstart.context "nodejs"

if [ `kickstart.os` == "Ubuntu" ]; then
  kickstart.apt.ppa ppa:chris-lea/node.js
  kickstart.package.install nodejs
else
  kickstart.info "No instructions for: " `kickstart.os`
fi

