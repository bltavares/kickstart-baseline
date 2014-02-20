if [ `kickstart.os` == "Ubuntu" ]; then
  kickstart.package.install python-dev python-pip

  if [ `which pip` == "/usr/bin/pip" ]; then 
    kickstart.mute "pip install --upgrade pip"
  fi

  kickstart.mute  "pip install --upgrade pip virtualenv"
fi
