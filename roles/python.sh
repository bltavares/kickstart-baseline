kickstart.context "python"

baseline.python.packages() {
  kickstart.os.is Ubuntu && echo python-dev python-pip
  kickstart.os.is Mac && echo python
}

kickstart.package.install `baseline.python.packages`

if [ `which pip` == "/usr/bin/pip" ]; then 
  kickstart.mute "pip install --upgrade pip"
fi

kickstart.mute  "pip install --upgrade pip virtualenv"
