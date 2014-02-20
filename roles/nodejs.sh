kickstart.context nodejs

[[ `kickstart.os` == "Ubuntu" ]] && kickstart.apt.ppa ppa:chris-lea/node.js
kickstart.package.install nodejs

